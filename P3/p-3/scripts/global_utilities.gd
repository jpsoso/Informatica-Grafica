extends Node

func positiveX (profile2D : PackedVector2Array) -> bool:
	var positive = true
	for i in range(profile2D.size()):
		if (profile2D[i][0] < 0):
			positive = false
	return positive

func LatheGeometrySmooth ( profile2D : PackedVector2Array, 
						steps : int, 
						vertices : PackedVector3Array, 
						indexes : PackedInt32Array) :
	
	# Check preconditions
	assert(steps > 0,  "Number of steps must be positive")
	assert(positiveX(profile2D),  "All x coordinates from the profile must be positive")
	assert(vertices.is_empty(), "The vertices vector must be empty")
	assert(indexes.is_empty(), "The indexes vector must be empty")
	
	# Generate vertices
	for i in range(profile2D.size()) : # For each point in the profile
		var point = profile2D[i]
		for j in range(steps): # Rotation of that point. Number of rotation is determined by @param steps
			var angle = (j / float(steps)) * 2 * PI # Getting the rotation angle is dividing 2PI by the number of steps, and multiply by the number of the step we are in
			var x = point[0] * cos(angle)
			var y = point[1]
			var z = point[0] * sin(angle)
			vertices.append( Vector3(x, y, z) )
	
	# Generate indexes
	for i in range(profile2D.size() - 1) : # For each point in the profile BUT NOT THE LAST ONE! The last row is treated different
		for j in range(steps) : 
			var next_j = (j + 1) % steps
			var current = i * steps + j
			var next = (i + 1) * steps + j
			var current_next = i * steps + next_j
			var next_next = (i + 1) * steps + next_j


			indexes.append(next_next)
			indexes.append(next)
			indexes.append(current)
			
			indexes.append(current_next)
			indexes.append(next_next)
			indexes.append(current)

func LatheGeometryHard(profile2D: PackedVector2Array, 
						steps: int, 
						vertices: PackedVector3Array, 
						indexes: PackedInt32Array):
	
	# Check preconditions
	assert(steps > 0,  "Number of steps must be positive")
	assert(positiveX(profile2D),  "All x coordinates from the profile must be positive")
	assert(vertices.is_empty(), "The vertices vector must be empty")
	assert(indexes.is_empty(), "The indexes vector must be empty")

	for i in range(profile2D.size() - 1): # For each point in the profile, discarting the upper one
		for j in range(steps):				# For each step that is being done in the rotation
			var next_j = (j + 1) % steps
			var p0 = profile2D[i]
			var p1 = profile2D[i + 1]

			# Generate 4 points, containing 2 triangles in them
			var angle0 = (j / float(steps)) * 2 * PI
			var angle1 = (next_j / float(steps)) * 2 * PI

			var v0 = Vector3(p0.x * cos(angle0), p0.y, p0.x * sin(angle0))
			var v1 = Vector3(p1.x * cos(angle0), p1.y, p1.x * sin(angle0))
			var v2 = Vector3(p1.x * cos(angle1), p1.y, p1.x * sin(angle1))
			var v3 = Vector3(p0.x * cos(angle1), p0.y, p0.x * sin(angle1))

			# Each face will have its own unique vertices (no sharing)
			var base = vertices.size()

			# First triangle
			vertices.append(v0)
			vertices.append(v1)
			vertices.append(v2)
			indexes.append(base + 2)
			indexes.append(base + 1)
			indexes.append(base)

			# Second triangle
			vertices.append(v0)
			vertices.append(v2)
			vertices.append(v3)
			indexes.append(base + 5)
			indexes.append(base + 4)
			indexes.append(base + 3)
	

func computeNormals( verts : PackedVector3Array, 
				   tris  : PackedInt32Array ) -> PackedVector3Array :

	## Paso 1: comprobar precondiciones
	assert( verts.size() >= 3 , "CalcNormales: la malla debe tener al menos 3 vértices" )
	assert( tris.size() % 3 == 0 , "CalcNormales: el número de enteros en 'tris' debe ser múltiplo de 3")
	
	var nv : int = verts.size()  ## número de vértices
	var nt : int = tris.size()/3 ## número de triángulos
	
	# Paso 2: inicializa normales a cero
	var normales := PackedVector3Array([]) 
	for i in nv:
		normales.append( Vector3.ZERO )
	
	# Paso 3: For each triangle, compute its face normal
	for it in nt :
		var a_idx = tris[3 * it + 0]
		var b_idx = tris[3 * it + 1]
		var c_idx = tris[3 * it + 2]
		
		var a = verts[a_idx]
		var b = verts[b_idx]
		var c = verts[c_idx]
		
		var n = (c - a).cross(b - a).normalized()
		
		# Assign directly — don't sum
		normales[a_idx] = n
		normales[b_idx] = n
		normales[c_idx] = n
	
	# No longer needed since we add only one normal, not the addition of all of them
	# Paso 4: normalizar normales
	# for iv in nv:
	#	normales[iv] = normales[iv].normalized()
	
	# Hecho
	return normales
