const passLocationToEmergencyBtn = (pos) => {
  const crd = pos.coords;

  console.log('Your current position is:');
  console.log(`Latitude : ${crd.latitude}`);
  console.log(`Longitude: ${crd.longitude}`);
  console.log(`More or less ${crd.accuracy} meters.`);

  const emergencyBtn = document.querySelector("#emergency-button");
  emergencyBtn.href =  emergencyBtn.href + `?lat=${crd.latitude}&lon=${crd.longitude}`;
}
const getPosition = () => {
  navigator.geolocation.getCurrentPosition(passLocationToEmergencyBtn);
}


export { getPosition };

