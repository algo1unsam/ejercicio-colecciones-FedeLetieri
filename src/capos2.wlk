object espada{
	
	var nueva = true
	
	method poder(duenio) {
		return duenio.poderBase() / if(nueva) {1} else {2}
	}	
	
	method usar() {
		nueva = false;
	}
}

object collar {
	var cantidadDeBatallas = 0
	const base = 3
	
	method poder(duenio) {
		return base + if (duenio.poderBase() > 6) { cantidadDeBatallas } else {0}
	}
	
	method usar() {
		cantidadDeBatallas +=1
	}
}

object armadura {
	method poder(duenio) {
		return 6
	} 
	
	method usar() {
		//no tiene efecto
	}
}

object libro {
	
	var property hechizos = []
	
//	method agregarHechizo(hechizo) {
//		hechizos.add(hechizo)
//	}
	
	method poder(duenio) {
		return if (hechizos.isEmpty()) 0 else hechizos.first().poder(duenio)
	}
	
	method usar() {
		//hechizos.remove(hechizos.first())
		hechizos = hechizos.drop(1)
	}
}

///// hechizos
//-- Bendición: aporta 4 de poder de pelea
object bendicion {
	method poder(duenio) {
		return 4
	}
}
//-- Invisibilidad: aporta la misma cantidad de poder de pelea que el personaje
object invisibilidad{
	method poder(duenio) {
		return duenio.poderBase()
	}
}
//-- Invocación: Aporta el valor del artefacto más poderoso para el héroe que posee en su morada. (el artefacto del castillo no sufre ningún efecto por la batalla)
object invocacion {
	method poder(duenio) {
		return duenio.poderArtefactoMasPoderosoDeLaCasa()
	}
}

object castillo {
	
	const property artefactos = #{}
		
	method agregarArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)		
	}
	
//	method poderArtefactoMasPoderoso(duenio) {
//		if(artefactos.isEmpty()) {
//			return 0
//		}
//		return self.poderMasPoderoso(duenio).poder(duenio)
//	}
//	
//	method poderMasPoderoso(duenio) {
//		return artefactos.max({ artefacto => artefacto.poder(duenio)})
//	}

	method poderArtefactoMasPoderoso(duenio) {
		return artefactos.map({ artefacto => artefacto.poder(duenio)}).maxIfEmpty({0})
	}
}


object rolando {

	const property artefactos = #{}
	var property capacidad = 2
	const casa = castillo
	const property historia = []
	var property poderBase = 5

	method encontrar(artefacto) {
		if(artefactos.size() < capacidad) {
			artefactos.add(artefacto)
		}
		historia.add(artefacto)
	}
	
	method volverACasa() {
		casa.agregarArtefactos(artefactos)
		artefactos.clear()
	}	
	
	method posesiones() {
		return self.artefactos() + casa.artefactos()
	}
	
	method posee(artefacto) {
		return self.posesiones().contains(artefacto)	
	}
	
	method poder() {
		return self.poderBase() + self.sumatoriaDePoderesArtefactos()
	}
	
	method sumatoriaDePoderesArtefactos() {
		return artefactos.sum({ artefacto => artefacto.poder(self)})
	}
	
	method batalla() {
		poderBase += 1
		artefactos.forEach({artefacto => artefacto.usar() })
	}
	
	method poderArtefactoMasPoderosoDeLaCasa() {
		return casa.poderArtefactoMasPoderoso(self)
	}
	
	
	
	
		
}

