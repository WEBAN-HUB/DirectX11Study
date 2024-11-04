#pragma once
#include "Types.h"

struct Vertex
{
	Vec3 position; //12 byte 오프셋 위치 +0
	Color color; // 16 byte 오프셋 위치 +12 -> 위의 position 만큼 뒤에 존재/
};