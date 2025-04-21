extends Node2D

##################################################
var snow_texture: Texture = preload("res://scenes/snow/snow.png")
# 눈송이 텍스처 미리 불러오기

var gpu_particles_node: GPUParticles2D
# GPUParticles2D 노드 참조용 변수

##################################################
func _ready() -> void:
	gpu_particles_node = $GPUParticles2D
	# 씬 내의 GPUParticles2D 노드를 가져옴
	gpu_particles_node.amount = 150
	# 동시에 화면에 표시될 최대 눈송이 수
	gpu_particles_node.texture = snow_texture
	# 입자의 텍스처 지정
	gpu_particles_node.lifetime = 20.0
	# 눈송이가 사라지기까지의 시간
	gpu_particles_node.position = Vector2(960.0, -64.0)
	# 입자 발생을 화면 위쪽 중앙에 배치
	
	var process_material = ParticleProcessMaterial.new()
	# 파티클의 물리 처리를 담당할 머티리얼 생성
	process_material.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	# 입자 발생 모양을 BOX 형태로 설정
	process_material.emission_box_extents = Vector3(960.0, 0.0, 0.0)
	# 박스의 반 너비 설정으로 화면 전체가 됨
	process_material.direction = Vector3(0.0, 1.0, 0.0)
	# 입자가 기본적으로 아래로 떨어지도록 방향 지정
	process_material.spread = 15.0
	# 입자가 퍼지는 각도 범위
	process_material.initial_velocity_min = 20.0
	# 입자의 초기 속도 최소값
	process_material.initial_velocity_max = 200.0
	# 입자의 초기 속도 최대값
	process_material.gravity = Vector3(0.0, 240.0, 0.0)
	# 중력 설정으로 눈이 서서히 가속되며 떨어짐
	process_material.scale_min = 0.5
	# 입자 크기 최소값
	process_material.scale_max = 1.0
	# 입자 크기 최대값
	process_material.turbulence_enabled = true
	# Turbulence 활성화
	# 눈송이가 바람에 흔들리듯 자연스럽게 움직임
	process_material.turbulence_noise_strength = 0.5
	# 값을 줄여 덜 흔들리게 함 (1.0이 기본)
	
	gpu_particles_node.process_material = process_material
	# 위에서 설정한 파라미터를 파티클 노드에 적용
	
	
