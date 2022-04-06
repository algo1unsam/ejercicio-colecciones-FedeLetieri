object rolando {
	const property artefactos =#{}
	const property artefactosTotales=[]
	const property artefactosVistos=[]
	
	method levantarObjetos(artefacto){
		
		if (artefactos.size() < 2)/*capacidad=2*/{
			artefactos.add(artefacto)
			artefactosTotales.add(artefacto)
		}
		self.artefactosVistos(artefacto)
	}
	//Guarda El objeto
	method guardarObjetos(){
		castilloDePiedra.guardarObjetos(artefactos)
		artefactos.clear()
	}
	
	/*POSESIONES
		METHOD POSECIONES(){
		return self.artefactos() + casa.artefactos()
		
	
	*/
	//Pregunta por un objeto en particular si lo tiene (encima)
	method ContieneObjetoEspecial(artefacto){
		artefactos.contains(artefacto)//Esta mal(Creo)
		//Pregunta si lo contiene encima o en el castillo
		// Por lo tanto
		//return self.posesiones().contains(artefacto) o self.artefactosTotales().contains(artefacto)
	}	
	
	//Guarda todos los artefactos vistos (agarrados o sin agarrar)
	method artefactosVistos(artefacto){
		artefactosVistos.add(artefacto)
	}
	
	
}
object castilloDePiedra{
	const property cofre= #{}
	
	method guardarObjetos(artefactos){
		cofre.addAll(artefactos)
	}
	
}	
object espadaDelDestino{}
object libroDeHechizos{}
object collarDivino{}
object armaduraDeAceroValyrio{}