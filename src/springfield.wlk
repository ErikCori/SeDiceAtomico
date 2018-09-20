object springfield{
	var property vientos = 10
	var property riquezaDelSuelo = 0.9
	var centrales = #{burns, exBosque, elSuspiro}
	
	method centralesContaminantes(){
		return centrales.filter({central => central.esContaminante()})
	}
}

object burns{
	var property varillasDeUranio = 10
	
	method produccionEnergetica(ciudad){
		return 0.1 * varillasDeUranio
	}
	
	method esContaminante(){
		return varillasDeUranio > 20
	}
}

object exBosque{
	var property capacidad
	
	method produccionEnergetica(ciudad){
		return 0.5 + capacidad * ciudad.riquezaDelSuelo()
	}
	
	method esContaminante(){
		return true
	}
}

object elSuspiro{
	var turbinas = [turbina1]
	
	method produccionEnergetica(ciudad){
		return turbinas.sum({turbina => turbina.produccionEnergetica(ciudad)})
	}
	
	method esContaminante(){
		return false
	}
}

object turbina1{
	method produccionEnergetica(ciudad){
		return 0.2 * ciudad.vientos()
	}
}