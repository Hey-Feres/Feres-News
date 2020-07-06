class App {
	constructor() {
	}
	switchToDarkMode(){
		$("body").addClass("darkBody")
	}
	switchToLightMode(){
		$("body").removeClass("darkBody")
	}
}