<template>
<v-container>
  <div v-if="!session">
    <v-btn color="primary" @click="joinSession()">
      준비 다 되셨나요???
    </v-btn>
    <input v-model="myUserName" type="text">
  </div>  
  <div v-if="session">
    <div>
      <h1>{{ mySessionId }}</h1>
      <v-btn @click="leaveSession" color="error">
        방에서 나가기
      </v-btn>
      <v-btn @click="videoMute">
        <v-icon v-if="videoMuted === true">mdi-video-check-outline</v-icon>
        <v-icon v-else>mdi-video-check</v-icon>
      </v-btn>
      <v-btn v-if="subscribers.length >= 1" @click="audioMute">
        <v-icon v-if="audioMuted === true">mdi-volume-off</v-icon>
        <v-icon v-else>mdi-volume-high</v-icon>
      </v-btn>     
    </div>    
    <v-row>
      <v-col cols="6">
        <user-video :stream-manager="mainStreamManager"/>
      </v-col>
      <v-col cols="6">
        <user-video v-for="sub in subscribers" :key="sub.stream.connection.connectionId" :stream-manager="sub"/>
      </v-col>
    </v-row>
    <div>      
      <label>
        <v-icon>mdi-chat</v-icon>
      </label>
      <select v-model="talkTo">
        <option v-for="(connection,n) in connections" :key="n" :value="n">
          {{n!==0 ? JSON.parse(connection.data.split('%')[0]).clientData : "모두에게"}}
        </option>
      </select>
      <input id="textInput" v-bind:value="inputText" v-on:input="updateInput">
      <v-btn @click="sendMessage">
        메세지 보내기
      </v-btn>
      <select v-model="banTo">
        <option v-for="(connection,n) in connections" :key="n" :value="n">
          {{n!==0 ? JSON.parse(connection.data.split('%')[0]).clientData : "강퇴하기"}}
        </option>
      </select>      
      <v-btn @click="kickUser">
        강퇴
      </v-btn>
      <select v-model="silenceTo">
        <option v-for="(subscriber,n) in subscribers" :key="n" :value="n">
          {{JSON.parse(subscriber.stream.connection.data.split('%')[0]).clientData}}
        </option>
      </select>      
      <v-btn @click="makeSilence">
        침묵시키기
      </v-btn>
    </div>
    <div>
      <v-btn @click="republish">
        republish
      </v-btn>
      <v-btn @click="unpublish">
        unpublish
      </v-btn>
    </div>
    <div id="chat">
    </div>
  </div>
  
</v-container>
</template>
<script>
import axios from 'axios'
import { OpenVidu } from 'openvidu-browser'
import UserVideo from '@/components/conference/UserVideo'
axios.defaults.headers.post['Content-Type'] = 'application/json';
const SERVER_URL = process.env.VUE_APP_SERVER_URL

// const OPENVIDU_SERVER_URL = "https://" + location.hostname + ":4443";
// const OPENVIDU_SERVER_SECRET = "MY_SECRET";

export default {
  name: "ConferenceMeeting",
  data(){
    return {
      OV: undefined,
			session: undefined,
			mainStreamManager: undefined,
			publisher: undefined,
			subscribers: [],      
      talkTo: 0,
      connections: [],
      banTo: 0,
      silenceTo: 0,
      videoMuted: false,
      audioMuted: false,
      mySessionId: null,
      myUserName: 'chan',
      inputText: '',
      token: null,
    }
  },
  components:{
    UserVideo
  },
  created() {
    this.mySessionId = String(this.$route.params.conferenceId)
  },
  methods: {
    joinSession () {
      this.OV = new OpenVidu();
      this.OV.setAdvancedConfiguration({
          publisherSpeakingEventsOptions: {
              interval: 100,   // Frequency of the polling of audio streams in ms (default 100)
              threshold: -50  // Threshold volume in dB (default -50)
          }
      });
      this.session = this.OV.initSession();

      this.session.on('streamCreated', ({ stream }) => {
        const subscriber = this.session.subscribe(stream)
        this.subscribers.push(subscriber)             
      })

      this.session.on('streamDestroyed', ({ stream }) => {
        const index = this.subscribers.indexOf(stream.streamManager, 0)
        if (index >= 0) {
          this.subscribers.splice(index, 1)
        }
      })

      this.session.on('exception', ({ exception }) => {
        console.warn(exception)
      })

      this.session.on('signal:my-chat', (event) => {
        const chat = document.getElementById("chat")
        const p = document.createElement("p")
        p.innerText = `${JSON.parse(event.from.data.split('%')[0]).clientData}: ${event.data}`
        chat.append(p)        
      })

      this.session.on('connectionCreated', (event) => {
        this.connections.push(event.connection)        
        console.log("connections:", this.connections)
      })

      this.session.on('connectionDestroyed', (event)=> {
        console.log("disconnection:", event)
        const index = this.connections.indexOf(event.connection, 0)
        console.log("index:", index)
        if (index >= 0) {
          this.connections.splice(index, 1)
        }
      })

      this.session.on('signal:kick-msg', () => {        
        alert("강퇴당했습니다.")
        this.$router.push({ name: 'Home'})        
      })
      

      //수정?
      this.session.on('publisherStartSpeaking', (event) => {
          console.log('User ' + event.connection.connectionId + ' start speaking');
      });

      this.session.on('publisherStopSpeaking', (event) => {
          console.log('User ' + event.connection.connectionId + ' stop speaking');
      });

      // user token
      this.getToken(this.mySessionId).then(token => {
        console.log("token:",token)
        this.token = token
        this.session.connect(token, { clientData: this.myUserName})
          .then(() => {
            let publisher = this.OV.initPublisher(undefined, {
              audioSource: undefined, // The source of audio. If undefined default microphone
							videoSource: undefined, // The source of video. If undefined default webcam
							publishAudio: true,  	// Whether you want to start publishing with your audio unmuted or not
							publishVideo: true,  	// Whether you want to start publishing with your video enabled or not
							resolution: '640x480',  // The resolution of your video
							frameRate: 30,			// The frame rate of your video
							insertMode: 'APPEND',	// How the video is inserted in the target element 'video-container'
							mirror: false       	// Whether to mirror your local video or not
            })

            this.mainStreamManager = publisher
            this.publisher = publisher            

            this.session.publish(this.publisher)            
          })
          .catch(error => {
            console.log('There was an error connecting to the session:', error.code, error.message);
          })
      })

      window.addEventListener('beforeunload', this.leaveSession)
    },
    // 위까지가 joinSession

    leaveSession () {
      if (this.session) {
        axios({
          baseURL: SERVER_URL,
          method: 'delete',
          url: `conference/${this.mySessionId}/leave`,
          data: {
            token: this.token
          },
          headers: {
            'X-AUTH-TOKEN': this.$store.state.auth.user.token
          },
        })
        .then(res => console.log(res))
        .catch(err => console.error(err))
        this.session.disconnect()}

      this.session = undefined;
			this.mainStreamManager = undefined;
			this.publisher = undefined;
			this.subscribers = [];
			this.OV = undefined;

      window.removeEventListener('beforeunload', this.leaveSession);
      this.$router.push({ name: 'Home'})
    },

    // 여기까지 leaveSession

    updateMainVideoStreamManager (stream) {
      if (this.mainStreamManager === stream) return;
      this.mainStreamManager = stream;
    },

    // 여기서부터 server와 상호작용
    getToken (mySessionId) {      
      const token = this.createToken(mySessionId)
      console.log("createdToken:", token)
      return token
    },

    // createSession (sessionId) {
    //   return new Promise((resolve, reject) => {
    //     axios
    //       .post(`${OPENVIDU_SERVER_URL}/openvidu/api/sessions`, JSON.stringify({
    //         customSessionId: sessionId,
    //       }), {
    //         auth: {
    //           username: 'OPENVIDUAPP',
    //           password: OPENVIDU_SERVER_SECRET,
    //         },
    //       })
    //       .then(response => {
    //         console.log("response",response)
    //         response.data})
    //       .then(data => resolve(data.id))
    //       .catch(error => {
    //         if(error.response.status === 409) {
    //           resolve(sessionId)
    //         } else {
    //           console.warn(`No connection to OpenVidu Server. This may be a certificate error at ${OPENVIDU_SERVER_URL}`);
		// 					if (window.confirm(`No connection to OpenVidu Server. This may be a certificate error at ${OPENVIDU_SERVER_URL}\n\nClick OK to navigate and accept it. If no certificate warning is shown, then check that your OpenVidu Server is up and running at "${OPENVIDU_SERVER_URL}"`)) {
		// 						location.assign(`${OPENVIDU_SERVER_URL}/accept-certificate`);
    //           }
		// 					reject(error.response);
    //         }
    //       })
    //   })
    // },

    //여기까지 createSession

    createToken (sessionId) {
			return new Promise((resolve, reject) => {
				axios({
          method:'get',
          baseURL: SERVER_URL,
          url: `/conference/${sessionId}/token`,
          headers: {
            'X-AUTH-TOKEN': this.$store.state.auth.user.token
          },

          }
        )
        .then(response => {
          console.log(response.data)
          return response.data})
        .then(data => resolve(data))
        .catch(error => reject(error.response));
					// .get(`https://localhost:8080/conference/${sessionId}/token`, {}, {
					// 	headers: {
          //     'X-AUTH-TOKEN': this.$store.state.auth.user.token
          //   },
					// })
			});
		},
    videoMute() {      
      if (this.videoMuted) {
        this.publisher.publishVideo(true)
        this.videoMuted = false        
      } else {
        this.publisher.publishVideo(false)
        this.videoMuted = true
      }
      console.log("publisher:",this.publisher)
    },
    audioMute() {
      if (this.audioMuted) {
        this.publisher.publishAudio(true)
        this.audioMuted = false
      } else {
        this.publisher.publishAudio(false)
        this.audioMuted = true
      }
    },
    updateInput: function(event) {
      var updatedText = event.target.value
      this.inputText = updatedText
    },
    sendMessage(){
      if(this.talkTo === 0) {
        this.session.signal({
          data: this.inputText,
          to: [],
          type: 'my-chat'
        })
        .then(() => {          
          console.log('Message successfully sent')
          this.inputText = ''
        })
        .catch(error => {
          console.error(error)
        })
      } else {
        this.session.signal({
          data: this.inputText,
          to: [this.connections[0],this.connections[this.talkTo]],
          type: 'my-chat'
        })
        .then(() => {          
          console.log('Private Message successfully sent')
          this.inputText = ''
        })
        .catch(error => {
          console.error(error)
        })
      }
    },
    kickUser(){
      console.log("connection:", this.connections[this.banTo])
      if(this.banTo !== 0){
        this.session.signal({
          to: [this.connections[this.banTo]],
          type: 'kick-msg'
        })
        .then(res => console.log(res))
        .catch(err => console.error(err))
        // axios({
        //   method:'get',
          
        // })
        this.session.forceDisconnect(this.connections[this.banTo])
        this.banTo = 0
      }
    },
    republish(){
      this.session.publish(this.publisher)
    },
    unpublish(){
      this.session.unpublish(this.publisher)
    },
    makeSilence(){
      console.log(this.subscribers[this.silenceTo].stream)
      this.session.forceUnpublish(this.subscribers[this.silenceTo].stream)
      this.silenceTo = 0
    }
  }
}
</script>
<style scoped>
#textInput{
  background-color: lightgray;
}
</style>