struct VS_INPUT
{
    float4 position : POSITION;
    float4 color : COLOR;
};

struct VS_OUTPUT
{
    float4 position : SV_POSITION; // SV = 시스템 밸류
    float4 color : COLOR;
};

// 렌더링 파이프라인 요약
// INPUT ASSEMBLY - VERTEX SHADER - RESTER RIZER - PIXEL SHADER - OUTPUT MERGER

// 버텍스 쉐이더 단계
VS_OUTPUT VS(VS_INPUT input)
{
    VS_OUTPUT output;
    output.position = input.position;
    output.color = input.color;
    
    return output;
}

// 픽셀 쉐이더 단계
float4 PS(VS_OUTPUT input) : SV_Target
{
    return input.color;
}