class App {
	constructor() {
	}
	switchToDarkMode(){
		$("body").addClass("darkBody")
	}
	switchToLightMode(){
		$("body").removeClass("darkBody")
	}
	getLocation(){
		if (navigator.geolocation) {
	    	navigator.geolocation.getCurrentPosition(this.showPosition);
	  	} else { 
	    	console.log("Not supported")
	  	}
	}
	showPosition(position) {
		console.log(position.coords.latitude)
		console.log(position.coords.longitude)
		//
		let lat = position.coords.latitude
		let lng = position.coords.longitude
		let request = new Request()
		let url = `https://api.opencagedata.com/geocode/v1/json?q=${lat}+${lng}&key=edd4c09a708542b3ac95b1fde3d17fdd`
		let successCallback = data => {
			console.log(data.results[0].components.country_code)
		}
		let errorCallback = (x,y,z) => {
			console.log(x)
		}
		let reponse = request.get(url,successCallback,errorCallback)
	}

}


