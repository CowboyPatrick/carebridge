const passLocationToEmergencyBtn = (pos) => {
  const emergencyBtn = document.getElementById('emergency-button')
  if (emergencyBtn) {
    const crd = pos.coords;

    // console.log('Your current position is:');
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude: ${crd.longitude}`);
    // console.log(`More or less ${crd.accuracy} meters.`);

    const emergencyBtn = document.querySelector("#emergency-button");
    emergencyBtn.href =  emergencyBtn.href + `?emergency=true&lat=${crd.latitude}&lon=${crd.longitude}`;

    // fetch('/api/v1/emergency', {
    //   method: 'POST',
    //   headers: {
    //     'Content-Type': 'application/json'
    //   },
    //   body: JSON.stringify(pos)
    // })
  }
}

const getPosition = () => {
  navigator.geolocation.getCurrentPosition(passLocationToEmergencyBtn);
}


export { getPosition };

