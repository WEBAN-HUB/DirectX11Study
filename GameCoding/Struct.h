#pragma once
#include "Types.h"

struct Vertex
{
	Vec3 position; //12 byte 오프셋 위치 +0
	//Color color; // 16 byte 오프셋 위치 +12 -> 위의 position 만큼 뒤에 존재/
	Vec2 uv;
};

struct TransformData
{
	Vec3 offset;
	float dummy; // constant buffer를 만들 때 16바이트로 정렬해야하기 때문에 더미 데이터를 작성
};