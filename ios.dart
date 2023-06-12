// 建立 RTCPeerConnection
const configuration = { iceServers: [{ urls: 'stun:stun.example.com' }] }; // 替換為您的STUN伺服器

const peerConnection = new RTCPeerConnection(configuration);

// 處理 ICE 候選者
peerConnection.onicecandidate = (event) => {
  if (event.candidate) {
    const iceCandidate = event.candidate;
    // 發送 ICE 候選者到對等端（使用信令伺服器或其他方式）
  }
};

// 接收到遠端媒體流
peerConnection.ontrack = (event) => {
  const remoteStream = event.streams[0];
  // 在此處理遠端媒體流的相關操作
};

// 建立本地描述並設定
peerConnection.createOffer()
  .then((offer) => peerConnection.setLocalDescription(offer))
  .then(() => {
    const localDescription = peerConnection.localDescription;
    // 發送本地描述到對等端（使用信令伺服器或其他方式）
  })
  .catch((error) => console.error('建立本地描述時發生錯誤:', error));

// 接收到對等端的訊息
peerConnection.ondatachannel = (event) => {
  const dataChannel = event.channel;
  // 在此處理資料通道的相關操作
};

// 建立資料通道
const dataChannel = peerConnection.createDataChannel('dataChannel');
// 假設已經建立好 dataChannel

// 發送資料
dataChannel.send('Hello, World!');

// 接收資料
dataChannel.onmessage = (event) => {
  const message = event.data;
  // 在此處理接收到的資料
};