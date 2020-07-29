class News {
	constructor() {
	}
	buildNewsCarousel(){
		var nodeList = document.querySelectorAll('#todayNews');
		for ( var i = 0, t = nodeList.length; i < t; i++ ) {
		    var flkty = Flickity.data( nodeList[i] )
		    if ( !flkty ) {
		        // Check if element had flickity options specified in data attribute.
		        var flktyData = nodeList[i].getAttribute( 'data-flickity' );
		        if ( flktyData ) {
		            var flktyOptions = JSON.parse( flktyData );
		            new Flickity( nodeList[i], flktyOptions );
		        } else {
		            new Flickity( nodeList[i] );
		        }
		    }
		}		
	}
}