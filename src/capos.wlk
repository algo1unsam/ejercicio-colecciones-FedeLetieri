object rolando {
	const property artefactos =#{}
	const property artefactosTotales=[]
	const property artefactosVistos=[]
	
	method levantarObjetos(artefacto){
		self.artefactosVistos(artefacto)
		if (artefactos.size() < 2){
			artefactos.add(artefacto)
			artefactosTotales.add(artefacto)
		}
	}
	//Guarda El objeto
	method guardarObjetos(){
		castilloDePiedra.guardarObjetos(artefactos)
		artefactos.clear()
	}
	
	//Pregunta por un objeto en particular si lo tiene (encima)
	method ContieneObjetoEspecial(artefacto){
		artefactos.contains(artefacto)
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