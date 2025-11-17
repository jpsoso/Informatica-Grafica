# utilidades.gd

static func calcUV(vertices: PackedVector3Array) -> PackedVector2Array:
	var uvs := PackedVector2Array()
	var max_u = 1.0
	var max_v = 1.0
	
	for vert in vertices:
		# 1. Calcular el valor del parámetro u
		var phi = atan2(vert.z, vert.x)
		var u = max_u*(phi / (2.0 * PI) + 0.5) # This step is to make range from 0 to 1

		# 2. Calcular el valor del parámetro v
		
		# Inserta tu código aquí
		# Puedes calcularlo en función del desplazamiento en el perfil (sencilla)
		# o de forma aproximada en función de y (compleja)
		
		var uv_coords = Vector2(u, v)
		uvs.append(uv_coords)
	return uvs
