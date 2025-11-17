@tool
extends MeshInstance3D

@export var texture = Texture2D

func _ready() -> void:
	# Generate profile and the steps
	var profile := generateProfilePawn()
	var steps := 128
	
	## crear las tablas de vértices y triángulos de  
	var vertices   := PackedVector3Array([])
	var triangulos := PackedInt32Array([])

	GlobalUtilities.LatheGeometryHard( profile, steps, vertices, triangulos )
		
	var normales := GlobalUtilities.computeNormals( vertices, triangulos )
	assert( vertices.size() == normales.size() )
			
	## inicializar el array con las tablas
	var tablas : Array = []   ## tabla vacía incialmente
	tablas.resize( Mesh.ARRAY_MAX ) ## redimensionar al tamaño adecuado
	tablas[ Mesh.ARRAY_VERTEX ] = vertices
	tablas[ Mesh.ARRAY_INDEX  ] = triangulos
	tablas[ Mesh.ARRAY_NORMAL ] = normales
	
	## Inicializamos las coordenadas de texturas
	var uvs = GlobalUtilities.calcUV(vertices)
	tablas[ Mesh.ARRAY_TEX_UV ] = uvs
	
	## crear e inicialzar el objeto 'mesh' de este nodo 
	mesh = ArrayMesh.new() ## crea malla en modo diferido, vacía
	mesh.add_surface_from_arrays( Mesh.PRIMITIVE_TRIANGLES, tablas )
	
	## crear un material
	var mat := StandardMaterial3D.new()
	mat.albedo_texture = texture
	# mat.albedo_color = Color(0.423, 0.668, 1.0, 1.0)
	# mat.metallic = 0.3
	# mat.roughness = 0.2
	# mat.shading_mode = BaseMaterial3D.SHADING_MODE_PER_PIXEL
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_PER_VERTEX
	
	# WHY SHADING_MODE_PER_VERTEX PRODUCES LESS REALISTIC SHADES IN OBJECTS THAN SHADING_MODE_PER_PIXEL
	# Computing light per vertex is less accurate than in pixel since in vertex we are only computing 
	# light in the vertexes, and then interpolating it to the rest pixels. This is more efficient than
	# computing light in exactly every single pixel, but it results in less realistic lightning of 
	# objects.
	
	material_override = mat

func generateProfileCylinder() -> PackedVector2Array :
	# Cylinder
	var profile := PackedVector2Array([]) 
	
	profile.append( Vector2(0,0) )
	profile.append( Vector2(2,0) )
	profile.append( Vector2(2,3) )
	profile.append( Vector2(0,3) )
	
	return profile
	
func generateProfilePawn() -> PackedVector2Array:
	var profile := PackedVector2Array([])

	profile.append(Vector2(1.2, 0.0))
	profile.append(Vector2(1.4, 0.2))

	profile.append(Vector2(1.3, 0.5))
	profile.append(Vector2(0.9, 0.8))

	profile.append(Vector2(0.6, 1.6))
	profile.append(Vector2(0.5, 2.2))

	profile.append(Vector2(0.4, 2.5))
	profile.append(Vector2(0.35, 2.8))

	profile.append(Vector2(0.45, 3.0))
	profile.append(Vector2(0.55, 3.2))
	profile.append(Vector2(0.45, 3.4))

	return profile
