struct VS_INPUT
{
    float4 position : POSITION;
    //float4 color : COLOR;
    float2 uv : TEXCOORD;
};

struct VS_OUTPUT
{
    float4 position : SV_POSITION; // SV = 시스템 밸류
    //float4 color : COLOR;
    float2 uv : TEXCOORD;
};


// cbuffer는 상수 버퍼를 정의하는 구문이다.
// register(b0): b0 레지스터에 이 상수 버퍼를 바인딩한다.
// 이는 상수 버퍼의 슬롯을 지정하는 것이야.
cbuffer TransformData : register(b0)
{
    float4 offset;
}


// 렌더링 파이프라인 요약
// INPUT ASSEMBLY - VERTEX SHADER - RESTER RIZER - PIXEL SHADER - OUTPUT MERGER

// 버텍스 쉐이더 단계
VS_OUTPUT VS(VS_INPUT input)
{
    VS_OUTPUT output;
    output.position = input.position + offset;
    output.uv = input.uv;
    
    return output;
}

// Texture2D는 2D 텍스처를 나타내는 타입이다.
// 이는 셰이더에서 이미지를 처리할 때 사용
Texture2D texture0 : register(t0);
Texture2D texture1 : register(t1);
// SamplerState는 텍스처 샘플링을 위한 상태를 정의한다. 
// 이는 텍스처 데이터를 어떻게 읽고 필터링할지를 설정하는 데 사용
SamplerState sampler0 : register(s0);

// 픽셀 쉐이더 단계
float4 PS(VS_OUTPUT input) : SV_Target
{
    float4 color = texture1.Sample(sampler0, input.uv);
    return color;
}