importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');

/*Update with yours config*/
const firebaseConfig = {
  apiKey: 'AIzaSyDCJYXTg21Uov6q4Se3liJ1RipT4YQaVwA',
  authDomain: 'handyman-4320f.firebaseapp.com',
  projectId: 'handyman-4320f',
  storageBucket: 'handyman-4320f.appspot.com',
  messagingSenderId: '424125149466',
  appId: '1:424125149466:web:f57941d4ec139b46e47ca3',
  measurementId: 'G-Q7MNWPZYSX',
};
firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

/*messaging.onMessage((payload) => {
  console.log('Message received. ', payload);*/
messaging.onBackgroundMessage(function (payload) {
  console.log('Received background message ', payload);

  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});
