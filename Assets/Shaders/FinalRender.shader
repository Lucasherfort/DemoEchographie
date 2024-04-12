Shader "Square/FinalRender"
{
	Properties
	{
		_LayerInside("LayerInside", 2D) = "white" {}
		_LayerBorder("LayerBorder", 2D) = "white" {}
	}
	SubShader
	{
		Pass
		{
			CGPROGRAM

			#pragma vertex vertexFunc
			#pragma fragment fragmentFunc

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 position : SV_POSITION;
				float2 uv : TEXCOORD0;
			};

			sampler2D _LayerInside;
			sampler2D _LayerBorder;

			v2f vertexFunc(appdata IN)
			{
				v2f OUT;

				OUT.position = UnityObjectToClipPos(IN.vertex);
				OUT.uv.xy = IN.uv.xy;

				return OUT;
			}

			float4 PixelColorInside;
			float4 PixelColorBorder;

			float4 fragmentFunc(v2f IN) : SV_Target
			{
				float4 finalTexture;

				PixelColorInside = tex2D(_LayerInside, IN.uv.xy);
				PixelColorBorder = tex2D(_LayerBorder, IN.uv.xy);

				finalTexture = (PixelColorInside + PixelColorBorder);

				return finalTexture;
			}
			ENDCG
		}
	}
}