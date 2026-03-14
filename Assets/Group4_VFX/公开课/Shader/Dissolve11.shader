// Made with Amplify Shader Editor v1.9.9.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "CY/1/Dissolve1"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_Offset_Z( "Offset_Z", Float ) = 0
		_Depth( "软边", Float ) = 0
		[Enum(UnityEngine.Rendering.CullMode)] _CullMode2( "双面", Float ) = 0
		[Toggle] _ZwrtteMode2( "深度", Float ) = 1
		[Enum(UnityEngine.Rendering.BlendMode)] _AddOneBlendSrcAlpha( "Add(One)Blend(Src Alpha)", Float ) = 5
		[Enum(UnityEngine.Rendering.BlendMode)] _AddOneBlendOneMinusSrcAlpha( "Add(One)Blend(One Minus Src Alpha)", Float ) = 10
		_Float23( "颜色强度", Float ) = 1
		_Float25( "透明度", Float ) = 1
		_Color2( "主颜色", Color ) = ( 1, 1, 1, 1 )
		_MainTex( "主贴图", 2D ) = "white" {}
		_Float16( "主贴图U速度", Float ) = 0
		_Float17( "主贴图V速度", Float ) = 0
		_Float18( "主贴图旋转", Range( 0, 360 ) ) = 0
		[Toggle] _ToggleSwitch5( "主贴图UV自定义", Float ) = 1
		_Float20( "主贴图扭曲强度", Float ) = 0
		_MainTex1( "副贴图", 2D ) = "black" {}
		_Main1Desaturate1( "去饱和度", Range( 0, 1 ) ) = 0
		_Float27( "副贴图U速度", Float ) = 0
		_Float26( "副贴图V速度", Float ) = 0
		_Float28( "副贴图旋转", Range( 0, 360 ) ) = 0
		_Float29( "副贴图扭曲强度", Float ) = 0
		_DissolveTex( "溶解贴图", 2D ) = "white" {}
		_Float2( "溶解U速度", Float ) = 0
		_Float7( "溶解V速度", Float ) = 0
		_Float1( "溶解旋转", Range( 0, 360 ) ) = 0
		_Float5( "溶解参数", Range( 0, 1 ) ) = 0.4784614
		_Float9( "软溶解", Range( 0.5, 1 ) ) = 0.5
		[Toggle] _ToggleSwitch4( "溶解自定义", Float ) = 0
		[Toggle] _ToggleSwitch6( "溶解UV自定义", Float ) = 0
		_Float19( "溶解扭曲强度", Float ) = 0
		[Toggle] _ToggleSwitch1( "描边", Float ) = 0
		_Color1( "描边颜色", Color ) = ( 1, 1, 1, 1 )
		_Float6( "描边宽度", Range( 0, 1 ) ) = 0.15
		_Float10( "描边强度", Float ) = 1
		[Toggle] _ToggleSwitch0( "方向溶解", Float ) = 0
		_Float11( "溶解方向", Range( 0, 360 ) ) = 0
		_Float15( "方向U偏移", Float ) = 0
		_Float12( "方向V偏移", Float ) = 0
		_Distortion1Tex1( "扭曲贴图1", 2D ) = "white" {}
		_Distortion1U( "扭曲1U", Float ) = 0
		_Distortion1V( "扭曲1V", Float ) = 0
		_Distortion1( "扭曲1参数", Range( 0, 1 ) ) = 0
		_Distortion2Tex1( "扭曲贴图2", 2D ) = "white" {}
		Distortion2U( "扭曲2U", Float ) = 0
		_Distortion2V( "扭曲2V", Float ) = 0
		_Distortion2( "扭曲2参数", Range( 0, 1 ) ) = 0
		_MaskTex2( "遮罩贴图", 2D ) = "white" {}
		_Mask1U1( "遮罩U", Float ) = 0
		_Mask1V1( "遮罩V", Float ) = 0
		_Mask1Rotation1( "遮罩旋转", Range( 0, 360 ) ) = 0
		[Toggle] _ToggleSwitch3( "遮罩UV自定义", Float ) = 0
		_Float24( "遮罩图扭曲强度", Float ) = 0


		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		//[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector][ToggleUI] _ReceiveShadows("Receive Shadows", Float) = 1.0

		//[HideInInspector] _AlphaClip("__clip", Float) = 0.0
	}

	SubShader
	{
		LOD 0

		

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Unlit" }

		Cull Back
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#if ( SHADER_TARGET > 35 ) && defined( SHADER_API_GLES3 )
			#error For WebGL2/GLES3, please set your shader target to 3.5 via SubShader options. URP shaders in ASE use target 4.5 by default.
		#endif

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#pragma shader_feature_local_fragment _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#define ASE_VERSION 19908
			#define ASE_SRP_VERSION 170004
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3

			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_UNLIT

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 positionWSAndFogFactor : TEXCOORD0;
				half3 normalWS : TEXCOORD1;
				half4 tangentWS : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color1;
			float4 _Color2;
			float4 _MainTex_ST;
			float4 _MaskTex2_ST;
			float4 _Distortion1Tex1_ST;
			float4 _MainTex1_ST;
			float4 _DissolveTex_ST;
			float4 _Distortion2Tex1_ST;
			float _Float1;
			float _ToggleSwitch6;
			float _Float2;
			float _Float7;
			float _Float19;
			float _ToggleSwitch0;
			float _Float15;
			float _ToggleSwitch4;
			float _Float11;
			float _Float5;
			float _Float6;
			float _Float25;
			float _Depth;
			float _Mask1Rotation1;
			float _ToggleSwitch3;
			half _Mask1U1;
			float _Float12;
			float _Offset_Z;
			float _Main1Desaturate1;
			float _Float10;
			float _ToggleSwitch1;
			float _Float23;
			float _Float18;
			float _ToggleSwitch5;
			float _Float16;
			float _Float17;
			half _Distortion1U;
			half _Distortion1V;
			float _Float9;
			float _Distortion1;
			half _Distortion2V;
			float _Distortion2;
			float _Float20;
			float _Float28;
			float _Float27;
			float _Float26;
			float _Float29;
			half _Mask1V1;
			half Distortion2U;
			float _Float24;
			float _AlphaClip;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Distortion1Tex1;
			sampler2D _Distortion2Tex1;
			sampler2D _MainTex1;
			sampler2D _DissolveTex;
			sampler2D _MaskTex2;


			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 worldToObj724 = mul( GetWorldToObjectMatrix(), float4( _WorldSpaceCameraPos, 1 ) ).xyz;
				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				float3 worldToObj723 = mul( GetWorldToObjectMatrix(), float4( ase_positionWS, 1 ) ).xyz;
				float3 normalizeResult727 = normalize( ( worldToObj724 - worldToObj723 ) );
				float3 Offset731 = ( normalizeResult727 * _Offset_Z );
				
				output.ase_color = input.ase_color;
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				output.ase_texcoord4 = input.ase_texcoord1;
				output.ase_texcoord5 = input.ase_texcoord2;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Offset731;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				float fogFactor = 0;
				#if defined(ASE_FOG) && !defined(_FOG_FRAGMENT)
					fogFactor = ComputeFogFactor(vertexInput.positionCS.z);
				#endif

				output.positionCS = vertexInput.positionCS;
				output.positionWSAndFogFactor = float4( vertexInput.positionWS, fogFactor );
				output.normalWS = normalInput.normalWS;
				output.tangentWS = half4( normalInput.tangentWS, ( input.tangentOS.w > 0.0 ? 1.0 : -1.0 ) * GetOddNegativeScale() );;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag ( PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				#if defined( _SURFACE_TYPE_TRANSPARENT )
					const bool isTransparent = true;
				#else
					const bool isTransparent = false;
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					float4 shadowCoord = TransformWorldToShadowCoord( input.positionWSAndFogFactor.xyz );
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				// @diogo: mikktspace compliant
				float renormFactor = 1.0 / max( FLT_MIN, length( input.normalWS ) );

				float3 PositionWS = input.positionWSAndFogFactor.xyz;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				half3 ViewDirWS = GetWorldSpaceNormalizeViewDir( PositionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );
				float3 TangentWS = input.tangentWS.xyz * renormFactor;
				float3 BitangentWS = cross( input.normalWS, input.tangentWS.xyz ) * input.tangentWS.w * renormFactor;
				float3 NormalWS = input.normalWS * renormFactor;

				float2 uv_MainTex = input.ase_texcoord3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float cos6_g76 = cos( radians( _Float18 ) );
				float sin6_g76 = sin( radians( _Float18 ) );
				float2 rotator6_g76 = mul( uv_MainTex - float2( 0.5,0.5 ) , float2x2( cos6_g76 , -sin6_g76 , sin6_g76 , cos6_g76 )) + float2( 0.5,0.5 );
				float2 appendResult871 = (float2(_Float16 , _Float17));
				float2 appendResult875 = (float2(input.ase_texcoord4.x , input.ase_texcoord4.y));
				float2 uv_Distortion1Tex1 = input.ase_texcoord3.xy * _Distortion1Tex1_ST.xy + _Distortion1Tex1_ST.zw;
				float2 panner16_g73 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion1Tex1);
				float2 appendResult8_g73 = (float2(_Distortion1U , _Distortion1V));
				float3 desaturateInitialColor758 = ( tex2D( _Distortion1Tex1, ( panner16_g73 + ( _TimeParameters.x * appendResult8_g73 ) ) ) * _Distortion1 ).rgb;
				float desaturateDot758 = dot( desaturateInitialColor758, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar758 = lerp( desaturateInitialColor758, desaturateDot758.xxx, 1.0 );
				float3 Distortion1759 = desaturateVar758;
				float2 uv_Distortion2Tex1 = input.ase_texcoord3.xy * _Distortion2Tex1_ST.xy + _Distortion2Tex1_ST.zw;
				float2 panner16_g72 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion2Tex1);
				float2 appendResult8_g72 = (float2(Distortion2U , _Distortion2V));
				float3 desaturateInitialColor757 = ( tex2D( _Distortion2Tex1, ( panner16_g72 + ( _TimeParameters.x * appendResult8_g72 ) ) ) * _Distortion2 ).rgb;
				float desaturateDot757 = dot( desaturateInitialColor757, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar757 = lerp( desaturateInitialColor757, desaturateDot757.xxx, 1.0 );
				float3 Distortion2760 = desaturateVar757;
				float3 lerpResult766 = lerp( float3( ( rotator6_g76 + (( _ToggleSwitch5 )?( appendResult875 ):( ( _TimeParameters.x * appendResult871 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float20);
				float4 tex2DNode89 = tex2D( _MainTex, lerpResult766.xy );
				float4 Main703 = tex2DNode89;
				float2 uv_MainTex1 = input.ase_texcoord3.xy * _MainTex1_ST.xy + _MainTex1_ST.zw;
				float cos6_g75 = cos( radians( _Float28 ) );
				float sin6_g75 = sin( radians( _Float28 ) );
				float2 rotator6_g75 = mul( uv_MainTex1 - float2( 0.5,0.5 ) , float2x2( cos6_g75 , -sin6_g75 , sin6_g75 , cos6_g75 )) + float2( 0.5,0.5 );
				float2 appendResult904 = (float2(_Float27 , _Float26));
				float3 lerpResult917 = lerp( float3( ( rotator6_g75 + ( _TimeParameters.x * appendResult904 ) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float29);
				float3 desaturateInitialColor927 = (tex2D( _MainTex1, lerpResult917.xy )).rgb;
				float desaturateDot927 = dot( desaturateInitialColor927, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar927 = lerp( desaturateInitialColor927, desaturateDot927.xxx, _Main1Desaturate1 );
				float3 Main1919 = desaturateVar927;
				float4 temp_output_771_0 = ( _Float23 * ( ( _Color2 * input.ase_color * Main703 ) + float4( Main1919 , 0.0 ) ) );
				float temp_output_577_0 = ( 1.0 - _Float9 );
				float2 uv_DissolveTex = input.ase_texcoord3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float cos6_g71 = cos( radians( _Float1 ) );
				float sin6_g71 = sin( radians( _Float1 ) );
				float2 rotator6_g71 = mul( uv_DissolveTex - float2( 0.5,0.5 ) , float2x2( cos6_g71 , -sin6_g71 , sin6_g71 , cos6_g71 )) + float2( 0.5,0.5 );
				float2 appendResult880 = (float2(_Float2 , _Float7));
				float2 appendResult883 = (float2(input.ase_texcoord5.y , input.ase_texcoord5.z));
				float3 lerpResult761 = lerp( float3( ( rotator6_g71 + (( _ToggleSwitch6 )?( appendResult883 ):( ( _TimeParameters.x * appendResult880 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float19);
				float2 appendResult686 = (float2(_Float15 , _Float12));
				float2 texCoord680 = input.ase_texcoord3.xy * float2( 1,1 ) + appendResult686;
				float cos683 = cos( radians( _Float11 ) );
				float sin683 = sin( radians( _Float11 ) );
				float2 rotator683 = mul( texCoord680 - float2( 0.5,0.5 ) , float2x2( cos683 , -sin683 , sin683 , cos683 )) + float2( 0.5,0.5 );
				float temp_output_663_0 = ( tex2D( _DissolveTex, lerpResult761.xy ).r * (( _ToggleSwitch0 )?( (rotator683).x ):( 1.0 )) );
				float smoothstepResult564 = smoothstep( temp_output_577_0 , _Float9 , saturate( ( temp_output_663_0 + 1.0 + ( -2.0 * (( _ToggleSwitch4 )?( input.ase_texcoord5.x ):( _Float5 )) ) ) ));
				float smoothstepResult626 = smoothstep( temp_output_577_0 , _Float9 , saturate( ( temp_output_663_0 + 1.0 + ( ( (( _ToggleSwitch4 )?( input.ase_texcoord5.x ):( _Float5 )) * ( 1.0 + _Float6 ) ) * -2.0 ) ) ));
				float DissolveLine605 = ( smoothstepResult564 - smoothstepResult626 );
				float4 lerpResult634 = lerp( temp_output_771_0 , ( _Float10 * _Color1 * DissolveLine605 ) , DissolveLine605);
				
				float Alpha706 = tex2DNode89.a;
				float Dissolve591 = smoothstepResult564;
				float screenDepth722 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ScreenPosNorm.xy ),_ZBufferParams);
				float distanceDepth722 = abs( ( screenDepth722 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _Depth ) );
				float clampResult725 = clamp( distanceDepth722 , 0.0 , 1.0 );
				float Depth728 = clampResult725;
				float2 uv_MaskTex2 = input.ase_texcoord3.xy * _MaskTex2_ST.xy + _MaskTex2_ST.zw;
				float cos6_g77 = cos( radians( _Mask1Rotation1 ) );
				float sin6_g77 = sin( radians( _Mask1Rotation1 ) );
				float2 rotator6_g77 = mul( uv_MaskTex2 - float2( 0.5,0.5 ) , float2x2( cos6_g77 , -sin6_g77 , sin6_g77 , cos6_g77 )) + float2( 0.5,0.5 );
				float2 appendResult861 = (float2(_Mask1U1 , _Mask1V1));
				float2 appendResult868 = (float2(input.ase_texcoord4.z , input.ase_texcoord4.w));
				float3 lerpResult898 = lerp( float3( ( rotator6_g77 + (( _ToggleSwitch3 )?( appendResult868 ):( ( _TimeParameters.x * appendResult861 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float24);
				float Mask1806 = tex2D( _MaskTex2, lerpResult898.xy ).r;
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = (( _ToggleSwitch1 )?( lerpResult634 ):( temp_output_771_0 )).rgb;
				float Alpha = ( _Float25 * ( ( _Color2.a * input.ase_color.a * Alpha706 ) * Dissolve591 * Depth728 * Mask1806 ) );
				#if defined( _ALPHATEST_ON )
					float AlphaClipThreshold = _Cutoff;
					float AlphaClipThresholdShadow = 0.5;
				#endif
				

				#if defined( ASE_DEPTH_WRITE_ON )
					input.positionCS.z = input.positionCS.z;
				#endif

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_CHANGES_WORLD_POS)
					ShadowCoord = TransformWorldToShadowCoord( PositionWS );
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = PositionWS;
				inputData.positionCS = input.positionCS;
				inputData.normalizedScreenSpaceUV = ScreenPosNorm.xy;
				inputData.normalWS = NormalWS;
				inputData.viewDirectionWS = ViewDirWS;

				#if defined(_SCREEN_SPACE_OCCLUSION) && !defined(_SURFACE_TYPE_TRANSPARENT)
					float2 normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(input.positionCS);
					AmbientOcclusionFactor aoFactor = GetScreenSpaceAmbientOcclusion(normalizedScreenSpaceUV);
					Color.rgb *= aoFactor.directAmbientOcclusion;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = InitializeInputDataFog(float4(inputData.positionWS, 1.0), input.positionWSAndFogFactor.w);
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(input.positionCS, Color);
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						Color.rgb = MixFogColor(Color.rgb, half3(0,0,0), inputData.fogCoord);
					#else
						Color.rgb = MixFog(Color.rgb, inputData.fogCoord);
					#endif
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = input.positionCS.z;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				#if defined( ASE_OPAQUE_KEEP_ALPHA )
					return half4( Color, Alpha );
				#else
					return half4( Color, OutputAlpha( Alpha, isTransparent ) );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FOG 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_VERSION 19908
			#define ASE_SRP_VERSION 170004
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color1;
			float4 _Color2;
			float4 _MainTex_ST;
			float4 _MaskTex2_ST;
			float4 _Distortion1Tex1_ST;
			float4 _MainTex1_ST;
			float4 _DissolveTex_ST;
			float4 _Distortion2Tex1_ST;
			float _Float1;
			float _ToggleSwitch6;
			float _Float2;
			float _Float7;
			float _Float19;
			float _ToggleSwitch0;
			float _Float15;
			float _ToggleSwitch4;
			float _Float11;
			float _Float5;
			float _Float6;
			float _Float25;
			float _Depth;
			float _Mask1Rotation1;
			float _ToggleSwitch3;
			half _Mask1U1;
			float _Float12;
			float _Offset_Z;
			float _Main1Desaturate1;
			float _Float10;
			float _ToggleSwitch1;
			float _Float23;
			float _Float18;
			float _ToggleSwitch5;
			float _Float16;
			float _Float17;
			half _Distortion1U;
			half _Distortion1V;
			float _Float9;
			float _Distortion1;
			half _Distortion2V;
			float _Distortion2;
			float _Float20;
			float _Float28;
			float _Float27;
			float _Float26;
			float _Float29;
			half _Mask1V1;
			half Distortion2U;
			float _Float24;
			float _AlphaClip;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Distortion1Tex1;
			sampler2D _Distortion2Tex1;
			sampler2D _DissolveTex;
			sampler2D _MaskTex2;


			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 worldToObj724 = mul( GetWorldToObjectMatrix(), float4( _WorldSpaceCameraPos, 1 ) ).xyz;
				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				float3 worldToObj723 = mul( GetWorldToObjectMatrix(), float4( ase_positionWS, 1 ) ).xyz;
				float3 normalizeResult727 = normalize( ( worldToObj724 - worldToObj723 ) );
				float3 Offset731 = ( normalizeResult727 * _Offset_Z );
				
				output.ase_color = input.ase_color;
				output.ase_texcoord.xy = input.ase_texcoord.xy;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Offset731;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );

				float2 uv_MainTex = input.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float cos6_g76 = cos( radians( _Float18 ) );
				float sin6_g76 = sin( radians( _Float18 ) );
				float2 rotator6_g76 = mul( uv_MainTex - float2( 0.5,0.5 ) , float2x2( cos6_g76 , -sin6_g76 , sin6_g76 , cos6_g76 )) + float2( 0.5,0.5 );
				float2 appendResult871 = (float2(_Float16 , _Float17));
				float2 appendResult875 = (float2(input.ase_texcoord1.x , input.ase_texcoord1.y));
				float2 uv_Distortion1Tex1 = input.ase_texcoord.xy * _Distortion1Tex1_ST.xy + _Distortion1Tex1_ST.zw;
				float2 panner16_g73 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion1Tex1);
				float2 appendResult8_g73 = (float2(_Distortion1U , _Distortion1V));
				float3 desaturateInitialColor758 = ( tex2D( _Distortion1Tex1, ( panner16_g73 + ( _TimeParameters.x * appendResult8_g73 ) ) ) * _Distortion1 ).rgb;
				float desaturateDot758 = dot( desaturateInitialColor758, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar758 = lerp( desaturateInitialColor758, desaturateDot758.xxx, 1.0 );
				float3 Distortion1759 = desaturateVar758;
				float2 uv_Distortion2Tex1 = input.ase_texcoord.xy * _Distortion2Tex1_ST.xy + _Distortion2Tex1_ST.zw;
				float2 panner16_g72 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion2Tex1);
				float2 appendResult8_g72 = (float2(Distortion2U , _Distortion2V));
				float3 desaturateInitialColor757 = ( tex2D( _Distortion2Tex1, ( panner16_g72 + ( _TimeParameters.x * appendResult8_g72 ) ) ) * _Distortion2 ).rgb;
				float desaturateDot757 = dot( desaturateInitialColor757, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar757 = lerp( desaturateInitialColor757, desaturateDot757.xxx, 1.0 );
				float3 Distortion2760 = desaturateVar757;
				float3 lerpResult766 = lerp( float3( ( rotator6_g76 + (( _ToggleSwitch5 )?( appendResult875 ):( ( _TimeParameters.x * appendResult871 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float20);
				float4 tex2DNode89 = tex2D( _MainTex, lerpResult766.xy );
				float Alpha706 = tex2DNode89.a;
				float temp_output_577_0 = ( 1.0 - _Float9 );
				float2 uv_DissolveTex = input.ase_texcoord.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float cos6_g71 = cos( radians( _Float1 ) );
				float sin6_g71 = sin( radians( _Float1 ) );
				float2 rotator6_g71 = mul( uv_DissolveTex - float2( 0.5,0.5 ) , float2x2( cos6_g71 , -sin6_g71 , sin6_g71 , cos6_g71 )) + float2( 0.5,0.5 );
				float2 appendResult880 = (float2(_Float2 , _Float7));
				float2 appendResult883 = (float2(input.ase_texcoord2.y , input.ase_texcoord2.z));
				float3 lerpResult761 = lerp( float3( ( rotator6_g71 + (( _ToggleSwitch6 )?( appendResult883 ):( ( _TimeParameters.x * appendResult880 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float19);
				float2 appendResult686 = (float2(_Float15 , _Float12));
				float2 texCoord680 = input.ase_texcoord.xy * float2( 1,1 ) + appendResult686;
				float cos683 = cos( radians( _Float11 ) );
				float sin683 = sin( radians( _Float11 ) );
				float2 rotator683 = mul( texCoord680 - float2( 0.5,0.5 ) , float2x2( cos683 , -sin683 , sin683 , cos683 )) + float2( 0.5,0.5 );
				float temp_output_663_0 = ( tex2D( _DissolveTex, lerpResult761.xy ).r * (( _ToggleSwitch0 )?( (rotator683).x ):( 1.0 )) );
				float smoothstepResult564 = smoothstep( temp_output_577_0 , _Float9 , saturate( ( temp_output_663_0 + 1.0 + ( -2.0 * (( _ToggleSwitch4 )?( input.ase_texcoord2.x ):( _Float5 )) ) ) ));
				float Dissolve591 = smoothstepResult564;
				float screenDepth722 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ScreenPosNorm.xy ),_ZBufferParams);
				float distanceDepth722 = abs( ( screenDepth722 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _Depth ) );
				float clampResult725 = clamp( distanceDepth722 , 0.0 , 1.0 );
				float Depth728 = clampResult725;
				float2 uv_MaskTex2 = input.ase_texcoord.xy * _MaskTex2_ST.xy + _MaskTex2_ST.zw;
				float cos6_g77 = cos( radians( _Mask1Rotation1 ) );
				float sin6_g77 = sin( radians( _Mask1Rotation1 ) );
				float2 rotator6_g77 = mul( uv_MaskTex2 - float2( 0.5,0.5 ) , float2x2( cos6_g77 , -sin6_g77 , sin6_g77 , cos6_g77 )) + float2( 0.5,0.5 );
				float2 appendResult861 = (float2(_Mask1U1 , _Mask1V1));
				float2 appendResult868 = (float2(input.ase_texcoord1.z , input.ase_texcoord1.w));
				float3 lerpResult898 = lerp( float3( ( rotator6_g77 + (( _ToggleSwitch3 )?( appendResult868 ):( ( _TimeParameters.x * appendResult861 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float24);
				float Mask1806 = tex2D( _MaskTex2, lerpResult898.xy ).r;
				

				float Alpha = ( _Float25 * ( ( _Color2.a * input.ase_color.a * Alpha706 ) * Dissolve591 * Depth728 * Mask1806 ) );
				#if defined( _ALPHATEST_ON )
					float AlphaClipThreshold = _Cutoff;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					input.positionCS.z = input.positionCS.z;
				#endif

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = input.positionCS.z;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FOG 1
			#define ASE_VERSION 19908
			#define ASE_SRP_VERSION 170004
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color1;
			float4 _Color2;
			float4 _MainTex_ST;
			float4 _MaskTex2_ST;
			float4 _Distortion1Tex1_ST;
			float4 _MainTex1_ST;
			float4 _DissolveTex_ST;
			float4 _Distortion2Tex1_ST;
			float _Float1;
			float _ToggleSwitch6;
			float _Float2;
			float _Float7;
			float _Float19;
			float _ToggleSwitch0;
			float _Float15;
			float _ToggleSwitch4;
			float _Float11;
			float _Float5;
			float _Float6;
			float _Float25;
			float _Depth;
			float _Mask1Rotation1;
			float _ToggleSwitch3;
			half _Mask1U1;
			float _Float12;
			float _Offset_Z;
			float _Main1Desaturate1;
			float _Float10;
			float _ToggleSwitch1;
			float _Float23;
			float _Float18;
			float _ToggleSwitch5;
			float _Float16;
			float _Float17;
			half _Distortion1U;
			half _Distortion1V;
			float _Float9;
			float _Distortion1;
			half _Distortion2V;
			float _Distortion2;
			float _Float20;
			float _Float28;
			float _Float27;
			float _Float26;
			float _Float29;
			half _Mask1V1;
			half Distortion2U;
			float _Float24;
			float _AlphaClip;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Distortion1Tex1;
			sampler2D _Distortion2Tex1;
			sampler2D _DissolveTex;
			sampler2D _MaskTex2;


			
			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 worldToObj724 = mul( GetWorldToObjectMatrix(), float4( _WorldSpaceCameraPos, 1 ) ).xyz;
				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				float3 worldToObj723 = mul( GetWorldToObjectMatrix(), float4( ase_positionWS, 1 ) ).xyz;
				float3 normalizeResult727 = normalize( ( worldToObj724 - worldToObj723 ) );
				float3 Offset731 = ( normalizeResult727 * _Offset_Z );
				
				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord3 = screenPos;
				
				output.ase_color = input.ase_color;
				output.ase_texcoord.xy = input.ase_texcoord.xy;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Offset731;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_MainTex = input.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float cos6_g76 = cos( radians( _Float18 ) );
				float sin6_g76 = sin( radians( _Float18 ) );
				float2 rotator6_g76 = mul( uv_MainTex - float2( 0.5,0.5 ) , float2x2( cos6_g76 , -sin6_g76 , sin6_g76 , cos6_g76 )) + float2( 0.5,0.5 );
				float2 appendResult871 = (float2(_Float16 , _Float17));
				float2 appendResult875 = (float2(input.ase_texcoord1.x , input.ase_texcoord1.y));
				float2 uv_Distortion1Tex1 = input.ase_texcoord.xy * _Distortion1Tex1_ST.xy + _Distortion1Tex1_ST.zw;
				float2 panner16_g73 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion1Tex1);
				float2 appendResult8_g73 = (float2(_Distortion1U , _Distortion1V));
				float3 desaturateInitialColor758 = ( tex2D( _Distortion1Tex1, ( panner16_g73 + ( _TimeParameters.x * appendResult8_g73 ) ) ) * _Distortion1 ).rgb;
				float desaturateDot758 = dot( desaturateInitialColor758, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar758 = lerp( desaturateInitialColor758, desaturateDot758.xxx, 1.0 );
				float3 Distortion1759 = desaturateVar758;
				float2 uv_Distortion2Tex1 = input.ase_texcoord.xy * _Distortion2Tex1_ST.xy + _Distortion2Tex1_ST.zw;
				float2 panner16_g72 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion2Tex1);
				float2 appendResult8_g72 = (float2(Distortion2U , _Distortion2V));
				float3 desaturateInitialColor757 = ( tex2D( _Distortion2Tex1, ( panner16_g72 + ( _TimeParameters.x * appendResult8_g72 ) ) ) * _Distortion2 ).rgb;
				float desaturateDot757 = dot( desaturateInitialColor757, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar757 = lerp( desaturateInitialColor757, desaturateDot757.xxx, 1.0 );
				float3 Distortion2760 = desaturateVar757;
				float3 lerpResult766 = lerp( float3( ( rotator6_g76 + (( _ToggleSwitch5 )?( appendResult875 ):( ( _TimeParameters.x * appendResult871 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float20);
				float4 tex2DNode89 = tex2D( _MainTex, lerpResult766.xy );
				float Alpha706 = tex2DNode89.a;
				float temp_output_577_0 = ( 1.0 - _Float9 );
				float2 uv_DissolveTex = input.ase_texcoord.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float cos6_g71 = cos( radians( _Float1 ) );
				float sin6_g71 = sin( radians( _Float1 ) );
				float2 rotator6_g71 = mul( uv_DissolveTex - float2( 0.5,0.5 ) , float2x2( cos6_g71 , -sin6_g71 , sin6_g71 , cos6_g71 )) + float2( 0.5,0.5 );
				float2 appendResult880 = (float2(_Float2 , _Float7));
				float2 appendResult883 = (float2(input.ase_texcoord2.y , input.ase_texcoord2.z));
				float3 lerpResult761 = lerp( float3( ( rotator6_g71 + (( _ToggleSwitch6 )?( appendResult883 ):( ( _TimeParameters.x * appendResult880 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float19);
				float2 appendResult686 = (float2(_Float15 , _Float12));
				float2 texCoord680 = input.ase_texcoord.xy * float2( 1,1 ) + appendResult686;
				float cos683 = cos( radians( _Float11 ) );
				float sin683 = sin( radians( _Float11 ) );
				float2 rotator683 = mul( texCoord680 - float2( 0.5,0.5 ) , float2x2( cos683 , -sin683 , sin683 , cos683 )) + float2( 0.5,0.5 );
				float temp_output_663_0 = ( tex2D( _DissolveTex, lerpResult761.xy ).r * (( _ToggleSwitch0 )?( (rotator683).x ):( 1.0 )) );
				float smoothstepResult564 = smoothstep( temp_output_577_0 , _Float9 , saturate( ( temp_output_663_0 + 1.0 + ( -2.0 * (( _ToggleSwitch4 )?( input.ase_texcoord2.x ):( _Float5 )) ) ) ));
				float Dissolve591 = smoothstepResult564;
				float4 screenPos = input.ase_texcoord3;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float screenDepth722 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ),_ZBufferParams);
				float distanceDepth722 = abs( ( screenDepth722 - LinearEyeDepth( ase_positionSSNorm.z,_ZBufferParams ) ) / ( _Depth ) );
				float clampResult725 = clamp( distanceDepth722 , 0.0 , 1.0 );
				float Depth728 = clampResult725;
				float2 uv_MaskTex2 = input.ase_texcoord.xy * _MaskTex2_ST.xy + _MaskTex2_ST.zw;
				float cos6_g77 = cos( radians( _Mask1Rotation1 ) );
				float sin6_g77 = sin( radians( _Mask1Rotation1 ) );
				float2 rotator6_g77 = mul( uv_MaskTex2 - float2( 0.5,0.5 ) , float2x2( cos6_g77 , -sin6_g77 , sin6_g77 , cos6_g77 )) + float2( 0.5,0.5 );
				float2 appendResult861 = (float2(_Mask1U1 , _Mask1V1));
				float2 appendResult868 = (float2(input.ase_texcoord1.z , input.ase_texcoord1.w));
				float3 lerpResult898 = lerp( float3( ( rotator6_g77 + (( _ToggleSwitch3 )?( appendResult868 ):( ( _TimeParameters.x * appendResult861 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float24);
				float Mask1806 = tex2D( _MaskTex2, lerpResult898.xy ).r;
				

				surfaceDescription.Alpha = ( _Float25 * ( ( _Color2.a * input.ase_color.a * Alpha706 ) * Dissolve591 * Depth728 * Mask1806 ) );
				#if defined( _ALPHATEST_ON )
					surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FOG 1
			#define ASE_VERSION 19908
			#define ASE_SRP_VERSION 170004
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color1;
			float4 _Color2;
			float4 _MainTex_ST;
			float4 _MaskTex2_ST;
			float4 _Distortion1Tex1_ST;
			float4 _MainTex1_ST;
			float4 _DissolveTex_ST;
			float4 _Distortion2Tex1_ST;
			float _Float1;
			float _ToggleSwitch6;
			float _Float2;
			float _Float7;
			float _Float19;
			float _ToggleSwitch0;
			float _Float15;
			float _ToggleSwitch4;
			float _Float11;
			float _Float5;
			float _Float6;
			float _Float25;
			float _Depth;
			float _Mask1Rotation1;
			float _ToggleSwitch3;
			half _Mask1U1;
			float _Float12;
			float _Offset_Z;
			float _Main1Desaturate1;
			float _Float10;
			float _ToggleSwitch1;
			float _Float23;
			float _Float18;
			float _ToggleSwitch5;
			float _Float16;
			float _Float17;
			half _Distortion1U;
			half _Distortion1V;
			float _Float9;
			float _Distortion1;
			half _Distortion2V;
			float _Distortion2;
			float _Float20;
			float _Float28;
			float _Float27;
			float _Float26;
			float _Float29;
			half _Mask1V1;
			half Distortion2U;
			float _Float24;
			float _AlphaClip;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Distortion1Tex1;
			sampler2D _Distortion2Tex1;
			sampler2D _DissolveTex;
			sampler2D _MaskTex2;


			
			float4 _SelectionID;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 worldToObj724 = mul( GetWorldToObjectMatrix(), float4( _WorldSpaceCameraPos, 1 ) ).xyz;
				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				float3 worldToObj723 = mul( GetWorldToObjectMatrix(), float4( ase_positionWS, 1 ) ).xyz;
				float3 normalizeResult727 = normalize( ( worldToObj724 - worldToObj723 ) );
				float3 Offset731 = ( normalizeResult727 * _Offset_Z );
				
				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord3 = screenPos;
				
				output.ase_color = input.ase_color;
				output.ase_texcoord.xy = input.ase_texcoord.xy;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Offset731;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_MainTex = input.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float cos6_g76 = cos( radians( _Float18 ) );
				float sin6_g76 = sin( radians( _Float18 ) );
				float2 rotator6_g76 = mul( uv_MainTex - float2( 0.5,0.5 ) , float2x2( cos6_g76 , -sin6_g76 , sin6_g76 , cos6_g76 )) + float2( 0.5,0.5 );
				float2 appendResult871 = (float2(_Float16 , _Float17));
				float2 appendResult875 = (float2(input.ase_texcoord1.x , input.ase_texcoord1.y));
				float2 uv_Distortion1Tex1 = input.ase_texcoord.xy * _Distortion1Tex1_ST.xy + _Distortion1Tex1_ST.zw;
				float2 panner16_g73 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion1Tex1);
				float2 appendResult8_g73 = (float2(_Distortion1U , _Distortion1V));
				float3 desaturateInitialColor758 = ( tex2D( _Distortion1Tex1, ( panner16_g73 + ( _TimeParameters.x * appendResult8_g73 ) ) ) * _Distortion1 ).rgb;
				float desaturateDot758 = dot( desaturateInitialColor758, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar758 = lerp( desaturateInitialColor758, desaturateDot758.xxx, 1.0 );
				float3 Distortion1759 = desaturateVar758;
				float2 uv_Distortion2Tex1 = input.ase_texcoord.xy * _Distortion2Tex1_ST.xy + _Distortion2Tex1_ST.zw;
				float2 panner16_g72 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion2Tex1);
				float2 appendResult8_g72 = (float2(Distortion2U , _Distortion2V));
				float3 desaturateInitialColor757 = ( tex2D( _Distortion2Tex1, ( panner16_g72 + ( _TimeParameters.x * appendResult8_g72 ) ) ) * _Distortion2 ).rgb;
				float desaturateDot757 = dot( desaturateInitialColor757, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar757 = lerp( desaturateInitialColor757, desaturateDot757.xxx, 1.0 );
				float3 Distortion2760 = desaturateVar757;
				float3 lerpResult766 = lerp( float3( ( rotator6_g76 + (( _ToggleSwitch5 )?( appendResult875 ):( ( _TimeParameters.x * appendResult871 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float20);
				float4 tex2DNode89 = tex2D( _MainTex, lerpResult766.xy );
				float Alpha706 = tex2DNode89.a;
				float temp_output_577_0 = ( 1.0 - _Float9 );
				float2 uv_DissolveTex = input.ase_texcoord.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float cos6_g71 = cos( radians( _Float1 ) );
				float sin6_g71 = sin( radians( _Float1 ) );
				float2 rotator6_g71 = mul( uv_DissolveTex - float2( 0.5,0.5 ) , float2x2( cos6_g71 , -sin6_g71 , sin6_g71 , cos6_g71 )) + float2( 0.5,0.5 );
				float2 appendResult880 = (float2(_Float2 , _Float7));
				float2 appendResult883 = (float2(input.ase_texcoord2.y , input.ase_texcoord2.z));
				float3 lerpResult761 = lerp( float3( ( rotator6_g71 + (( _ToggleSwitch6 )?( appendResult883 ):( ( _TimeParameters.x * appendResult880 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float19);
				float2 appendResult686 = (float2(_Float15 , _Float12));
				float2 texCoord680 = input.ase_texcoord.xy * float2( 1,1 ) + appendResult686;
				float cos683 = cos( radians( _Float11 ) );
				float sin683 = sin( radians( _Float11 ) );
				float2 rotator683 = mul( texCoord680 - float2( 0.5,0.5 ) , float2x2( cos683 , -sin683 , sin683 , cos683 )) + float2( 0.5,0.5 );
				float temp_output_663_0 = ( tex2D( _DissolveTex, lerpResult761.xy ).r * (( _ToggleSwitch0 )?( (rotator683).x ):( 1.0 )) );
				float smoothstepResult564 = smoothstep( temp_output_577_0 , _Float9 , saturate( ( temp_output_663_0 + 1.0 + ( -2.0 * (( _ToggleSwitch4 )?( input.ase_texcoord2.x ):( _Float5 )) ) ) ));
				float Dissolve591 = smoothstepResult564;
				float4 screenPos = input.ase_texcoord3;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float screenDepth722 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ),_ZBufferParams);
				float distanceDepth722 = abs( ( screenDepth722 - LinearEyeDepth( ase_positionSSNorm.z,_ZBufferParams ) ) / ( _Depth ) );
				float clampResult725 = clamp( distanceDepth722 , 0.0 , 1.0 );
				float Depth728 = clampResult725;
				float2 uv_MaskTex2 = input.ase_texcoord.xy * _MaskTex2_ST.xy + _MaskTex2_ST.zw;
				float cos6_g77 = cos( radians( _Mask1Rotation1 ) );
				float sin6_g77 = sin( radians( _Mask1Rotation1 ) );
				float2 rotator6_g77 = mul( uv_MaskTex2 - float2( 0.5,0.5 ) , float2x2( cos6_g77 , -sin6_g77 , sin6_g77 , cos6_g77 )) + float2( 0.5,0.5 );
				float2 appendResult861 = (float2(_Mask1U1 , _Mask1V1));
				float2 appendResult868 = (float2(input.ase_texcoord1.z , input.ase_texcoord1.w));
				float3 lerpResult898 = lerp( float3( ( rotator6_g77 + (( _ToggleSwitch3 )?( appendResult868 ):( ( _TimeParameters.x * appendResult861 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float24);
				float Mask1806 = tex2D( _MaskTex2, lerpResult898.xy ).r;
				

				surfaceDescription.Alpha = ( _Float25 * ( ( _Color2.a * input.ase_color.a * Alpha706 ) * Dissolve591 * Depth728 * Mask1806 ) );
				#if defined( _ALPHATEST_ON )
					surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = unity_SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

        	#define _SURFACE_TYPE_TRANSPARENT 1
        	#define ASE_FOG 1
        	#pragma multi_compile _ LOD_FADE_CROSSFADE
        	#define ASE_VERSION 19908
        	#define ASE_SRP_VERSION 170004
        	#define REQUIRE_DEPTH_TEXTURE 1


        	#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

            #if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				half3 normalWS : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color1;
			float4 _Color2;
			float4 _MainTex_ST;
			float4 _MaskTex2_ST;
			float4 _Distortion1Tex1_ST;
			float4 _MainTex1_ST;
			float4 _DissolveTex_ST;
			float4 _Distortion2Tex1_ST;
			float _Float1;
			float _ToggleSwitch6;
			float _Float2;
			float _Float7;
			float _Float19;
			float _ToggleSwitch0;
			float _Float15;
			float _ToggleSwitch4;
			float _Float11;
			float _Float5;
			float _Float6;
			float _Float25;
			float _Depth;
			float _Mask1Rotation1;
			float _ToggleSwitch3;
			half _Mask1U1;
			float _Float12;
			float _Offset_Z;
			float _Main1Desaturate1;
			float _Float10;
			float _ToggleSwitch1;
			float _Float23;
			float _Float18;
			float _ToggleSwitch5;
			float _Float16;
			float _Float17;
			half _Distortion1U;
			half _Distortion1V;
			float _Float9;
			float _Distortion1;
			half _Distortion2V;
			float _Distortion2;
			float _Float20;
			float _Float28;
			float _Float27;
			float _Float26;
			float _Float29;
			half _Mask1V1;
			half Distortion2U;
			float _Float24;
			float _AlphaClip;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Distortion1Tex1;
			sampler2D _Distortion2Tex1;
			sampler2D _DissolveTex;
			sampler2D _MaskTex2;


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 worldToObj724 = mul( GetWorldToObjectMatrix(), float4( _WorldSpaceCameraPos, 1 ) ).xyz;
				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				float3 worldToObj723 = mul( GetWorldToObjectMatrix(), float4( ase_positionWS, 1 ) ).xyz;
				float3 normalizeResult727 = normalize( ( worldToObj724 - worldToObj723 ) );
				float3 Offset731 = ( normalizeResult727 * _Offset_Z );
				
				output.ase_color = input.ase_color;
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				output.ase_texcoord2 = input.ase_texcoord1;
				output.ase_texcoord3 = input.ase_texcoord2;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Offset731;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS );

				output.positionCS = vertexInput.positionCS;
				output.normalWS = normalInput.normalWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			void frag(PackedVaryings input
						, out half4 outNormalWS : SV_Target0
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				half3 NormalWS = normalize( input.normalWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );

				float2 uv_MainTex = input.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float cos6_g76 = cos( radians( _Float18 ) );
				float sin6_g76 = sin( radians( _Float18 ) );
				float2 rotator6_g76 = mul( uv_MainTex - float2( 0.5,0.5 ) , float2x2( cos6_g76 , -sin6_g76 , sin6_g76 , cos6_g76 )) + float2( 0.5,0.5 );
				float2 appendResult871 = (float2(_Float16 , _Float17));
				float2 appendResult875 = (float2(input.ase_texcoord2.x , input.ase_texcoord2.y));
				float2 uv_Distortion1Tex1 = input.ase_texcoord1.xy * _Distortion1Tex1_ST.xy + _Distortion1Tex1_ST.zw;
				float2 panner16_g73 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion1Tex1);
				float2 appendResult8_g73 = (float2(_Distortion1U , _Distortion1V));
				float3 desaturateInitialColor758 = ( tex2D( _Distortion1Tex1, ( panner16_g73 + ( _TimeParameters.x * appendResult8_g73 ) ) ) * _Distortion1 ).rgb;
				float desaturateDot758 = dot( desaturateInitialColor758, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar758 = lerp( desaturateInitialColor758, desaturateDot758.xxx, 1.0 );
				float3 Distortion1759 = desaturateVar758;
				float2 uv_Distortion2Tex1 = input.ase_texcoord1.xy * _Distortion2Tex1_ST.xy + _Distortion2Tex1_ST.zw;
				float2 panner16_g72 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion2Tex1);
				float2 appendResult8_g72 = (float2(Distortion2U , _Distortion2V));
				float3 desaturateInitialColor757 = ( tex2D( _Distortion2Tex1, ( panner16_g72 + ( _TimeParameters.x * appendResult8_g72 ) ) ) * _Distortion2 ).rgb;
				float desaturateDot757 = dot( desaturateInitialColor757, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar757 = lerp( desaturateInitialColor757, desaturateDot757.xxx, 1.0 );
				float3 Distortion2760 = desaturateVar757;
				float3 lerpResult766 = lerp( float3( ( rotator6_g76 + (( _ToggleSwitch5 )?( appendResult875 ):( ( _TimeParameters.x * appendResult871 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float20);
				float4 tex2DNode89 = tex2D( _MainTex, lerpResult766.xy );
				float Alpha706 = tex2DNode89.a;
				float temp_output_577_0 = ( 1.0 - _Float9 );
				float2 uv_DissolveTex = input.ase_texcoord1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float cos6_g71 = cos( radians( _Float1 ) );
				float sin6_g71 = sin( radians( _Float1 ) );
				float2 rotator6_g71 = mul( uv_DissolveTex - float2( 0.5,0.5 ) , float2x2( cos6_g71 , -sin6_g71 , sin6_g71 , cos6_g71 )) + float2( 0.5,0.5 );
				float2 appendResult880 = (float2(_Float2 , _Float7));
				float2 appendResult883 = (float2(input.ase_texcoord3.y , input.ase_texcoord3.z));
				float3 lerpResult761 = lerp( float3( ( rotator6_g71 + (( _ToggleSwitch6 )?( appendResult883 ):( ( _TimeParameters.x * appendResult880 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float19);
				float2 appendResult686 = (float2(_Float15 , _Float12));
				float2 texCoord680 = input.ase_texcoord1.xy * float2( 1,1 ) + appendResult686;
				float cos683 = cos( radians( _Float11 ) );
				float sin683 = sin( radians( _Float11 ) );
				float2 rotator683 = mul( texCoord680 - float2( 0.5,0.5 ) , float2x2( cos683 , -sin683 , sin683 , cos683 )) + float2( 0.5,0.5 );
				float temp_output_663_0 = ( tex2D( _DissolveTex, lerpResult761.xy ).r * (( _ToggleSwitch0 )?( (rotator683).x ):( 1.0 )) );
				float smoothstepResult564 = smoothstep( temp_output_577_0 , _Float9 , saturate( ( temp_output_663_0 + 1.0 + ( -2.0 * (( _ToggleSwitch4 )?( input.ase_texcoord3.x ):( _Float5 )) ) ) ));
				float Dissolve591 = smoothstepResult564;
				float screenDepth722 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ScreenPosNorm.xy ),_ZBufferParams);
				float distanceDepth722 = abs( ( screenDepth722 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _Depth ) );
				float clampResult725 = clamp( distanceDepth722 , 0.0 , 1.0 );
				float Depth728 = clampResult725;
				float2 uv_MaskTex2 = input.ase_texcoord1.xy * _MaskTex2_ST.xy + _MaskTex2_ST.zw;
				float cos6_g77 = cos( radians( _Mask1Rotation1 ) );
				float sin6_g77 = sin( radians( _Mask1Rotation1 ) );
				float2 rotator6_g77 = mul( uv_MaskTex2 - float2( 0.5,0.5 ) , float2x2( cos6_g77 , -sin6_g77 , sin6_g77 , cos6_g77 )) + float2( 0.5,0.5 );
				float2 appendResult861 = (float2(_Mask1U1 , _Mask1V1));
				float2 appendResult868 = (float2(input.ase_texcoord2.z , input.ase_texcoord2.w));
				float3 lerpResult898 = lerp( float3( ( rotator6_g77 + (( _ToggleSwitch3 )?( appendResult868 ):( ( _TimeParameters.x * appendResult861 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float24);
				float Mask1806 = tex2D( _MaskTex2, lerpResult898.xy ).r;
				

				float Alpha = ( _Float25 * ( ( _Color2.a * input.ase_color.a * Alpha706 ) * Dissolve591 * Depth728 * Mask1806 ) );
				#if defined( _ALPHATEST_ON )
					float AlphaClipThreshold = _Cutoff;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					input.positionCS.z = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = input.positionCS.z;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(NormalWS);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					outNormalWS = half4(NormalizeNormalPerPixel( NormalWS ), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			ColorMask RG

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FOG 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_VERSION 19908
			#define ASE_SRP_VERSION 170004
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

            #define SHADERPASS SHADERPASS_MOTION_VECTORS

            #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
				#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MotionVectorsCommon.hlsl"

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 positionOld : TEXCOORD4;
				#if _ADD_PRECOMPUTED_VELOCITY
					float3 alembicMotionVector : TEXCOORD5;
				#endif
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 positionCSNoJitter : TEXCOORD0;
				float4 previousPositionCSNoJitter : TEXCOORD1;
				float3 positionWS : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color1;
			float4 _Color2;
			float4 _MainTex_ST;
			float4 _MaskTex2_ST;
			float4 _Distortion1Tex1_ST;
			float4 _MainTex1_ST;
			float4 _DissolveTex_ST;
			float4 _Distortion2Tex1_ST;
			float _Float1;
			float _ToggleSwitch6;
			float _Float2;
			float _Float7;
			float _Float19;
			float _ToggleSwitch0;
			float _Float15;
			float _ToggleSwitch4;
			float _Float11;
			float _Float5;
			float _Float6;
			float _Float25;
			float _Depth;
			float _Mask1Rotation1;
			float _ToggleSwitch3;
			half _Mask1U1;
			float _Float12;
			float _Offset_Z;
			float _Main1Desaturate1;
			float _Float10;
			float _ToggleSwitch1;
			float _Float23;
			float _Float18;
			float _ToggleSwitch5;
			float _Float16;
			float _Float17;
			half _Distortion1U;
			half _Distortion1V;
			float _Float9;
			float _Distortion1;
			half _Distortion2V;
			float _Distortion2;
			float _Float20;
			float _Float28;
			float _Float27;
			float _Float26;
			float _Float29;
			half _Mask1V1;
			half Distortion2U;
			float _Float24;
			float _AlphaClip;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MainTex;
			sampler2D _Distortion1Tex1;
			sampler2D _Distortion2Tex1;
			sampler2D _DissolveTex;
			sampler2D _MaskTex2;


			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 worldToObj724 = mul( GetWorldToObjectMatrix(), float4( _WorldSpaceCameraPos, 1 ) ).xyz;
				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				float3 worldToObj723 = mul( GetWorldToObjectMatrix(), float4( ase_positionWS, 1 ) ).xyz;
				float3 normalizeResult727 = normalize( ( worldToObj724 - worldToObj723 ) );
				float3 Offset731 = ( normalizeResult727 * _Offset_Z );
				
				output.ase_color = input.ase_color;
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				output.ase_texcoord4 = input.ase_texcoord1;
				output.ase_texcoord5 = input.ase_texcoord2;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Offset731;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				#if defined(APLICATION_SPACE_WARP_MOTION)
					output.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, input.positionOS));
					output.positionCS = output.positionCSNoJitter;
				#else
					output.positionCS = vertexInput.positionCS;
					output.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, input.positionOS));
				#endif

				float4 prevPos = ( unity_MotionVectorsParams.x == 1 ) ? float4( input.positionOld, 1 ) : input.positionOS;

				#if _ADD_PRECOMPUTED_VELOCITY
					prevPos = prevPos - float4(input.alembicMotionVector, 0);
				#endif

				output.previousPositionCSNoJitter = mul( _PrevViewProjMatrix, mul( UNITY_PREV_MATRIX_M, prevPos ) );
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}

			half4 frag(	PackedVaryings input
				#if defined( ASE_DEPTH_WRITE_ON )
				,out float outputDepth : ASE_SV_DEPTH
				#endif
				 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;

				float2 uv_MainTex = input.ase_texcoord3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float cos6_g76 = cos( radians( _Float18 ) );
				float sin6_g76 = sin( radians( _Float18 ) );
				float2 rotator6_g76 = mul( uv_MainTex - float2( 0.5,0.5 ) , float2x2( cos6_g76 , -sin6_g76 , sin6_g76 , cos6_g76 )) + float2( 0.5,0.5 );
				float2 appendResult871 = (float2(_Float16 , _Float17));
				float2 appendResult875 = (float2(input.ase_texcoord4.x , input.ase_texcoord4.y));
				float2 uv_Distortion1Tex1 = input.ase_texcoord3.xy * _Distortion1Tex1_ST.xy + _Distortion1Tex1_ST.zw;
				float2 panner16_g73 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion1Tex1);
				float2 appendResult8_g73 = (float2(_Distortion1U , _Distortion1V));
				float3 desaturateInitialColor758 = ( tex2D( _Distortion1Tex1, ( panner16_g73 + ( _TimeParameters.x * appendResult8_g73 ) ) ) * _Distortion1 ).rgb;
				float desaturateDot758 = dot( desaturateInitialColor758, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar758 = lerp( desaturateInitialColor758, desaturateDot758.xxx, 1.0 );
				float3 Distortion1759 = desaturateVar758;
				float2 uv_Distortion2Tex1 = input.ase_texcoord3.xy * _Distortion2Tex1_ST.xy + _Distortion2Tex1_ST.zw;
				float2 panner16_g72 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion2Tex1);
				float2 appendResult8_g72 = (float2(Distortion2U , _Distortion2V));
				float3 desaturateInitialColor757 = ( tex2D( _Distortion2Tex1, ( panner16_g72 + ( _TimeParameters.x * appendResult8_g72 ) ) ) * _Distortion2 ).rgb;
				float desaturateDot757 = dot( desaturateInitialColor757, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar757 = lerp( desaturateInitialColor757, desaturateDot757.xxx, 1.0 );
				float3 Distortion2760 = desaturateVar757;
				float3 lerpResult766 = lerp( float3( ( rotator6_g76 + (( _ToggleSwitch5 )?( appendResult875 ):( ( _TimeParameters.x * appendResult871 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float20);
				float4 tex2DNode89 = tex2D( _MainTex, lerpResult766.xy );
				float Alpha706 = tex2DNode89.a;
				float temp_output_577_0 = ( 1.0 - _Float9 );
				float2 uv_DissolveTex = input.ase_texcoord3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float cos6_g71 = cos( radians( _Float1 ) );
				float sin6_g71 = sin( radians( _Float1 ) );
				float2 rotator6_g71 = mul( uv_DissolveTex - float2( 0.5,0.5 ) , float2x2( cos6_g71 , -sin6_g71 , sin6_g71 , cos6_g71 )) + float2( 0.5,0.5 );
				float2 appendResult880 = (float2(_Float2 , _Float7));
				float2 appendResult883 = (float2(input.ase_texcoord5.y , input.ase_texcoord5.z));
				float3 lerpResult761 = lerp( float3( ( rotator6_g71 + (( _ToggleSwitch6 )?( appendResult883 ):( ( _TimeParameters.x * appendResult880 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float19);
				float2 appendResult686 = (float2(_Float15 , _Float12));
				float2 texCoord680 = input.ase_texcoord3.xy * float2( 1,1 ) + appendResult686;
				float cos683 = cos( radians( _Float11 ) );
				float sin683 = sin( radians( _Float11 ) );
				float2 rotator683 = mul( texCoord680 - float2( 0.5,0.5 ) , float2x2( cos683 , -sin683 , sin683 , cos683 )) + float2( 0.5,0.5 );
				float temp_output_663_0 = ( tex2D( _DissolveTex, lerpResult761.xy ).r * (( _ToggleSwitch0 )?( (rotator683).x ):( 1.0 )) );
				float smoothstepResult564 = smoothstep( temp_output_577_0 , _Float9 , saturate( ( temp_output_663_0 + 1.0 + ( -2.0 * (( _ToggleSwitch4 )?( input.ase_texcoord5.x ):( _Float5 )) ) ) ));
				float Dissolve591 = smoothstepResult564;
				float screenDepth722 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ScreenPosNorm.xy ),_ZBufferParams);
				float distanceDepth722 = abs( ( screenDepth722 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _Depth ) );
				float clampResult725 = clamp( distanceDepth722 , 0.0 , 1.0 );
				float Depth728 = clampResult725;
				float2 uv_MaskTex2 = input.ase_texcoord3.xy * _MaskTex2_ST.xy + _MaskTex2_ST.zw;
				float cos6_g77 = cos( radians( _Mask1Rotation1 ) );
				float sin6_g77 = sin( radians( _Mask1Rotation1 ) );
				float2 rotator6_g77 = mul( uv_MaskTex2 - float2( 0.5,0.5 ) , float2x2( cos6_g77 , -sin6_g77 , sin6_g77 , cos6_g77 )) + float2( 0.5,0.5 );
				float2 appendResult861 = (float2(_Mask1U1 , _Mask1V1));
				float2 appendResult868 = (float2(input.ase_texcoord4.z , input.ase_texcoord4.w));
				float3 lerpResult898 = lerp( float3( ( rotator6_g77 + (( _ToggleSwitch3 )?( appendResult868 ):( ( _TimeParameters.x * appendResult861 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float24);
				float Mask1806 = tex2D( _MaskTex2, lerpResult898.xy ).r;
				

				float Alpha = ( _Float25 * ( ( _Color2.a * input.ase_color.a * Alpha706 ) * Dissolve591 * Depth728 * Mask1806 ) );
				#if defined( _ALPHATEST_ON )
					float AlphaClipThreshold = _Cutoff;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					input.positionCS.z = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					float3 positionOS = mul( GetWorldToObjectMatrix(),  float4( PositionWS, 1.0 ) ).xyz;
					float3 previousPositionWS = mul( GetPrevObjectToWorldMatrix(),  float4( positionOS, 1.0 ) ).xyz;
					input.positionCSNoJitter = mul( _NonJitteredViewProjMatrix, float4( PositionWS, 1.0 ) );
					input.previousPositionCSNoJitter = mul( _PrevViewProjMatrix, float4( previousPositionWS, 1.0 ) );
				#endif

				#if defined( LOD_FADE_CROSSFADE )
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = input.positionCS.z;
				#endif

				#if defined(APLICATION_SPACE_WARP_MOTION)
					return float4( CalcAswNdcMotionVectorFromCsPositions( input.positionCSNoJitter, input.previousPositionCSNoJitter ), 1 );
				#else
					return float4( CalcNdcMotionVectorFromCsPositions( input.positionCSNoJitter, input.previousPositionCSNoJitter ), 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#pragma shader_feature_local_fragment _RECEIVE_SHADOWS_OFF
			#define ASE_FOG 1
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#define ASE_VERSION 19908
			#define ASE_SRP_VERSION 170004
			#define REQUIRE_DEPTH_TEXTURE 1


			// Deferred Rendering Path does not support the OpenGL-based graphics API:
			// Desktop OpenGL, OpenGL ES 3.0, WebGL 2.0.
			#pragma exclude_renderers glcore gles3 

			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				half3 normalWS : TEXCOORD1;
				half4 tangentWS : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color1;
			float4 _Color2;
			float4 _MainTex_ST;
			float4 _MaskTex2_ST;
			float4 _Distortion1Tex1_ST;
			float4 _MainTex1_ST;
			float4 _DissolveTex_ST;
			float4 _Distortion2Tex1_ST;
			float _Float1;
			float _ToggleSwitch6;
			float _Float2;
			float _Float7;
			float _Float19;
			float _ToggleSwitch0;
			float _Float15;
			float _ToggleSwitch4;
			float _Float11;
			float _Float5;
			float _Float6;
			float _Float25;
			float _Depth;
			float _Mask1Rotation1;
			float _ToggleSwitch3;
			half _Mask1U1;
			float _Float12;
			float _Offset_Z;
			float _Main1Desaturate1;
			float _Float10;
			float _ToggleSwitch1;
			float _Float23;
			float _Float18;
			float _ToggleSwitch5;
			float _Float16;
			float _Float17;
			half _Distortion1U;
			half _Distortion1V;
			float _Float9;
			float _Distortion1;
			half _Distortion2V;
			float _Distortion2;
			float _Float20;
			float _Float28;
			float _Float27;
			float _Float26;
			float _Float29;
			half _Mask1V1;
			half Distortion2U;
			float _Float24;
			float _AlphaClip;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MainTex;
			sampler2D _Distortion1Tex1;
			sampler2D _Distortion2Tex1;
			sampler2D _MainTex1;
			sampler2D _DissolveTex;
			sampler2D _MaskTex2;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 worldToObj724 = mul( GetWorldToObjectMatrix(), float4( _WorldSpaceCameraPos, 1 ) ).xyz;
				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				float3 worldToObj723 = mul( GetWorldToObjectMatrix(), float4( ase_positionWS, 1 ) ).xyz;
				float3 normalizeResult727 = normalize( ( worldToObj724 - worldToObj723 ) );
				float3 Offset731 = ( normalizeResult727 * _Offset_Z );
				
				output.ase_color = input.ase_color;
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				output.ase_texcoord4 = input.ase_texcoord1;
				output.ase_texcoord5 = input.ase_texcoord2;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Offset731;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				output.normalWS = normalInput.normalWS;
				output.tangentWS = half4( normalInput.tangentWS, ( input.tangentOS.w > 0.0 ? 1.0 : -1.0 ) * GetOddNegativeScale() );;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			FragmentOutput frag ( PackedVaryings input
								#if defined( ASE_DEPTH_WRITE_ON )
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				// @diogo: mikktspace compliant
				float renormFactor = 1.0 / max( FLT_MIN, length( input.normalWS ) );

				float3 PositionWS = input.positionWS;
				float3 ViewDirWS = GetWorldSpaceNormalizeViewDir( PositionWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );
				float3 TangentWS = input.tangentWS.xyz * renormFactor;
				float3 BitangentWS = cross( input.normalWS, input.tangentWS.xyz ) * input.tangentWS.w * renormFactor;
				float3 NormalWS = input.normalWS * renormFactor;

				float2 uv_MainTex = input.ase_texcoord3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float cos6_g76 = cos( radians( _Float18 ) );
				float sin6_g76 = sin( radians( _Float18 ) );
				float2 rotator6_g76 = mul( uv_MainTex - float2( 0.5,0.5 ) , float2x2( cos6_g76 , -sin6_g76 , sin6_g76 , cos6_g76 )) + float2( 0.5,0.5 );
				float2 appendResult871 = (float2(_Float16 , _Float17));
				float2 appendResult875 = (float2(input.ase_texcoord4.x , input.ase_texcoord4.y));
				float2 uv_Distortion1Tex1 = input.ase_texcoord3.xy * _Distortion1Tex1_ST.xy + _Distortion1Tex1_ST.zw;
				float2 panner16_g73 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion1Tex1);
				float2 appendResult8_g73 = (float2(_Distortion1U , _Distortion1V));
				float3 desaturateInitialColor758 = ( tex2D( _Distortion1Tex1, ( panner16_g73 + ( _TimeParameters.x * appendResult8_g73 ) ) ) * _Distortion1 ).rgb;
				float desaturateDot758 = dot( desaturateInitialColor758, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar758 = lerp( desaturateInitialColor758, desaturateDot758.xxx, 1.0 );
				float3 Distortion1759 = desaturateVar758;
				float2 uv_Distortion2Tex1 = input.ase_texcoord3.xy * _Distortion2Tex1_ST.xy + _Distortion2Tex1_ST.zw;
				float2 panner16_g72 = ( 1.0 * _Time.y * float2( 0,0 ) + uv_Distortion2Tex1);
				float2 appendResult8_g72 = (float2(Distortion2U , _Distortion2V));
				float3 desaturateInitialColor757 = ( tex2D( _Distortion2Tex1, ( panner16_g72 + ( _TimeParameters.x * appendResult8_g72 ) ) ) * _Distortion2 ).rgb;
				float desaturateDot757 = dot( desaturateInitialColor757, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar757 = lerp( desaturateInitialColor757, desaturateDot757.xxx, 1.0 );
				float3 Distortion2760 = desaturateVar757;
				float3 lerpResult766 = lerp( float3( ( rotator6_g76 + (( _ToggleSwitch5 )?( appendResult875 ):( ( _TimeParameters.x * appendResult871 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float20);
				float4 tex2DNode89 = tex2D( _MainTex, lerpResult766.xy );
				float4 Main703 = tex2DNode89;
				float2 uv_MainTex1 = input.ase_texcoord3.xy * _MainTex1_ST.xy + _MainTex1_ST.zw;
				float cos6_g75 = cos( radians( _Float28 ) );
				float sin6_g75 = sin( radians( _Float28 ) );
				float2 rotator6_g75 = mul( uv_MainTex1 - float2( 0.5,0.5 ) , float2x2( cos6_g75 , -sin6_g75 , sin6_g75 , cos6_g75 )) + float2( 0.5,0.5 );
				float2 appendResult904 = (float2(_Float27 , _Float26));
				float3 lerpResult917 = lerp( float3( ( rotator6_g75 + ( _TimeParameters.x * appendResult904 ) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float29);
				float3 desaturateInitialColor927 = (tex2D( _MainTex1, lerpResult917.xy )).rgb;
				float desaturateDot927 = dot( desaturateInitialColor927, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar927 = lerp( desaturateInitialColor927, desaturateDot927.xxx, _Main1Desaturate1 );
				float3 Main1919 = desaturateVar927;
				float4 temp_output_771_0 = ( _Float23 * ( ( _Color2 * input.ase_color * Main703 ) + float4( Main1919 , 0.0 ) ) );
				float temp_output_577_0 = ( 1.0 - _Float9 );
				float2 uv_DissolveTex = input.ase_texcoord3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float cos6_g71 = cos( radians( _Float1 ) );
				float sin6_g71 = sin( radians( _Float1 ) );
				float2 rotator6_g71 = mul( uv_DissolveTex - float2( 0.5,0.5 ) , float2x2( cos6_g71 , -sin6_g71 , sin6_g71 , cos6_g71 )) + float2( 0.5,0.5 );
				float2 appendResult880 = (float2(_Float2 , _Float7));
				float2 appendResult883 = (float2(input.ase_texcoord5.y , input.ase_texcoord5.z));
				float3 lerpResult761 = lerp( float3( ( rotator6_g71 + (( _ToggleSwitch6 )?( appendResult883 ):( ( _TimeParameters.x * appendResult880 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float19);
				float2 appendResult686 = (float2(_Float15 , _Float12));
				float2 texCoord680 = input.ase_texcoord3.xy * float2( 1,1 ) + appendResult686;
				float cos683 = cos( radians( _Float11 ) );
				float sin683 = sin( radians( _Float11 ) );
				float2 rotator683 = mul( texCoord680 - float2( 0.5,0.5 ) , float2x2( cos683 , -sin683 , sin683 , cos683 )) + float2( 0.5,0.5 );
				float temp_output_663_0 = ( tex2D( _DissolveTex, lerpResult761.xy ).r * (( _ToggleSwitch0 )?( (rotator683).x ):( 1.0 )) );
				float smoothstepResult564 = smoothstep( temp_output_577_0 , _Float9 , saturate( ( temp_output_663_0 + 1.0 + ( -2.0 * (( _ToggleSwitch4 )?( input.ase_texcoord5.x ):( _Float5 )) ) ) ));
				float smoothstepResult626 = smoothstep( temp_output_577_0 , _Float9 , saturate( ( temp_output_663_0 + 1.0 + ( ( (( _ToggleSwitch4 )?( input.ase_texcoord5.x ):( _Float5 )) * ( 1.0 + _Float6 ) ) * -2.0 ) ) ));
				float DissolveLine605 = ( smoothstepResult564 - smoothstepResult626 );
				float4 lerpResult634 = lerp( temp_output_771_0 , ( _Float10 * _Color1 * DissolveLine605 ) , DissolveLine605);
				
				float Alpha706 = tex2DNode89.a;
				float Dissolve591 = smoothstepResult564;
				float screenDepth722 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ScreenPosNorm.xy ),_ZBufferParams);
				float distanceDepth722 = abs( ( screenDepth722 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _Depth ) );
				float clampResult725 = clamp( distanceDepth722 , 0.0 , 1.0 );
				float Depth728 = clampResult725;
				float2 uv_MaskTex2 = input.ase_texcoord3.xy * _MaskTex2_ST.xy + _MaskTex2_ST.zw;
				float cos6_g77 = cos( radians( _Mask1Rotation1 ) );
				float sin6_g77 = sin( radians( _Mask1Rotation1 ) );
				float2 rotator6_g77 = mul( uv_MaskTex2 - float2( 0.5,0.5 ) , float2x2( cos6_g77 , -sin6_g77 , sin6_g77 , cos6_g77 )) + float2( 0.5,0.5 );
				float2 appendResult861 = (float2(_Mask1U1 , _Mask1V1));
				float2 appendResult868 = (float2(input.ase_texcoord4.z , input.ase_texcoord4.w));
				float3 lerpResult898 = lerp( float3( ( rotator6_g77 + (( _ToggleSwitch3 )?( appendResult868 ):( ( _TimeParameters.x * appendResult861 ) )) ) ,  0.0 ) , ( Distortion1759 + Distortion2760 ) , _Float24);
				float Mask1806 = tex2D( _MaskTex2, lerpResult898.xy ).r;
				

				float3 Color = (( _ToggleSwitch1 )?( lerpResult634 ):( temp_output_771_0 )).rgb;
				float Alpha = ( _Float25 * ( ( _Color2.a * input.ase_color.a * Alpha706 ) * Dissolve591 * Depth728 * Mask1806 ) );
				#if defined( _ALPHATEST_ON )
					float AlphaClipThreshold = _Cutoff;
					float AlphaClipThresholdShadow = 0.5;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					input.positionCS.z = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = PositionWS;
				inputData.positionCS = input.positionCS;
				inputData.normalizedScreenSpaceUV = ScreenPosNorm.xy;
				inputData.normalWS = NormalWS;
				inputData.viewDirectionWS = ViewDirWS;

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(input.positionCS, Color);
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = input.positionCS.z;
				#endif

				SurfaceData surfaceData = (SurfaceData)0;
				surfaceData.albedo = Color;
				surfaceData.alpha = Alpha;

			#if defined( _SCREEN_SPACE_OCCLUSION ) // GBuffer never has transparents
				float2 normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV( input.positionCS );
				AmbientOcclusionFactor aoFactor = GetScreenSpaceAmbientOcclusion( normalizedScreenSpaceUV );
				surfaceData.occlusion = aoFactor.directAmbientOcclusion;
			#else
				surfaceData.occlusion = 1;
			#endif

				return SurfaceDataToGbuffer( surfaceData, inputData, float3( 0, 0, 0 ), kLightingInvalid );
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraphUnlitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19908
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;590;-7861.636,2481.137;Inherit;False;3980.002;752.306;溶解;34;814;883;884;676;677;882;880;879;591;696;564;563;645;644;577;557;693;561;576;558;560;813;812;697;562;534;761;765;764;763;672;762;675;891;溶解;0.5330188,0.9809342,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;676;-7832.749,2852.029;Inherit;False;Property;_Float2;溶解U速度;22;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;677;-7833.628,2940.493;Inherit;False;Property;_Float7;溶解V速度;23;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;694;-7475.62,3469.386;Inherit;False;1847.433;474.8018;溶解方向;12;683;680;685;686;688;687;681;682;684;692;691;663;溶解方向;0.5518868,0.6059949,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;880;-7619.647,2892.463;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;814;-7664.069,3009.293;Inherit;False;2;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;879;-7638.595,2805.521;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;883;-7413.329,3057.699;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;688;-7425.62,3534.606;Inherit;False;Property;_Float15;方向U偏移;36;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;882;-7390.957,2839.283;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;687;-7424.467,3624.97;Inherit;False;Property;_Float12;方向V偏移;37;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;735;-7380.919,66.45311;Inherit;False;1661.234;460.8827;UV扭曲1;9;759;758;756;752;751;748;739;740;786;UV扭曲1;0.8514075,0.5707102,0.8962264,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;736;-7373.409,668.8082;Inherit;False;1627.432;453.1665;UV扭曲2;9;760;757;755;753;754;745;737;738;785;UV扭曲2;0.8514075,0.5707102,0.8962264,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;763;-6948.577,2893.155;Inherit;False;760;Distortion2;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;686;-7210.543,3576.289;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;684;-7240.043,3828.188;Inherit;False;Property;_Float11;溶解方向;35;0;Create;False;0;0;0;False;0;False;0;65;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;884;-7224.787,2835.754;Inherit;False;Property;_ToggleSwitch6;溶解UV自定义;28;0;Create;False;0;0;0;False;0;False;0;True;Create;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;762;-6946.378,2806.554;Inherit;False;759;Distortion1;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;675;-7594.006,2706.323;Inherit;False;Property;_Float1;溶解旋转;24;0;Create;False;0;0;0;False;0;False;0;141;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;672;-7555.704,2569.339;Inherit;False;0;534;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;738;-7248.758,895.0507;Half;False;Property;Distortion2U;扭曲2U;43;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;737;-7260.829,1002.566;Half;False;Property;_Distortion2V;扭曲2V;44;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;740;-7277.889,292.9712;Half;False;Property;_Distortion1U;扭曲1U;39;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;739;-7286.027,412.2793;Half;False;Property;_Distortion1V;扭曲1V;40;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;748;-7340.919,117.4531;Inherit;False;0;751;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;745;-7290.787,734.6099;Inherit;False;0;753;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RadiansOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;682;-6889.705,3812.776;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;681;-6964.899,3675.481;Inherit;False;Constant;_Vector0;Vector 0;20;0;Create;True;0;0;0;False;0;False;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;891;-6927.467,2637.474;Inherit;False;UV2;-1;;71;67e1d6e9cc356604b9c4aeadf01f46d7;0;3;13;FLOAT2;0,0;False;12;FLOAT;0;False;14;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;764;-6778.633,3021.293;Inherit;False;Property;_Float19;溶解扭曲强度;29;0;Create;False;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;765;-6724.33,2820.49;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;680;-7043.895,3531.245;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;785;-7021.289,822.2693;Inherit;False;UV1;-1;;72;de0c3f0bd82ab2c47b1e50f8136c9548;0;3;13;FLOAT2;0,0;False;14;FLOAT;0;False;15;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;786;-7044.628,241.2252;Inherit;False;UV1;-1;;73;de0c3f0bd82ab2c47b1e50f8136c9548;0;3;13;FLOAT2;0,0;False;14;FLOAT;0;False;15;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;761;-6518.552,2708.563;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;683;-6650.718,3652.771;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;901;-5541.879,1411.382;Inherit;False;2393.551;879.3185;副贴图;16;924;919;918;917;916;914;915;908;909;910;911;912;904;905;902;903;副贴图;0.9811321,0.7617207,0.4026344,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;704;-5527.471,392.1201;Inherit;False;2040.551;891.3185;主贴图;19;873;698;699;706;703;89;766;770;767;700;701;876;769;768;874;875;872;871;893;主贴图;0.9811321,0.7617207,0.4026344,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;646;-5784.048,4106.082;Inherit;False;2298.67;380.9553;描边;12;605;633;626;631;630;627;629;628;595;597;598;596;溶解描边;1,0.2783019,0.2783019,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;752;-6692.919,434.4524;Inherit;False;Property;_Distortion1;扭曲1参数;41;0;Create;False;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;753;-6717.408,796.8084;Inherit;True;Property;_Distortion2Tex1;扭曲贴图2;42;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;754;-6733.408,1004.808;Inherit;False;Property;_Distortion2;扭曲2参数;45;0;Create;False;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;751;-6724.919,210.4531;Inherit;True;Property;_Distortion1Tex1;扭曲贴图1;38;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;692;-6343.46,3519.386;Inherit;False;Constant;_Float0;Float 0;16;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;685;-6409.545,3649.388;Inherit;False;True;False;True;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;534;-6292.017,2729.647;Inherit;True;Property;_DissolveTex;溶解贴图;21;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;756;-6388.919,322.4521;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;755;-6413.409,892.8085;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;902;-5452.347,1899.903;Inherit;False;Property;_Float26;副贴图V速度;18;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;903;-5446.422,1797.344;Inherit;False;Property;_Float27;副贴图U速度;17;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;699;-5494.412,877.6158;Inherit;False;Property;_Float17;主贴图V速度;11;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;698;-5497.566,798.2516;Inherit;False;Property;_Float16;主贴图U速度;10;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;596;-5744.226,4328.666;Inherit;False;Property;_Float6;描边宽度;32;0;Create;False;0;0;0;False;0;False;0.15;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;598;-5648.226,4248.665;Inherit;False;Constant;_Float8;Float 8;11;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;691;-6139.358,3612.988;Inherit;False;Property;_ToggleSwitch0;方向溶解;34;0;Create;False;0;0;0;False;0;False;0;True;Create;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;697;-5959.62,2954.238;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;562;-5936.208,2890.915;Inherit;False;Property;_Float5;溶解参数;25;0;Create;False;0;0;0;False;0;False;0.4784614;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;812;-5900.053,2981.346;Inherit;False;2;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;757;-6253.409,796.8084;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;758;-6212.919,210.4531;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;904;-5226.668,1852.909;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;872;-5297.768,757.7965;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;905;-5245.617,1765.965;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;871;-5278.82,844.7403;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;873;-5332.759,984.3099;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;597;-5424.226,4264.665;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;560;-5581.532,2727.925;Inherit;False;Constant;_Float4;Float 4;7;0;Create;True;0;0;0;False;0;False;-2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;813;-5562.763,3014.13;Inherit;False;Property;_ToggleSwitch4;溶解自定义;27;0;Create;False;0;0;0;False;0;False;0;True;Create;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;663;-5863.188,3561.197;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;792;-2892.549,2482.77;Inherit;False;2107.044;735.9767;;15;796;795;804;806;794;793;809;861;862;863;867;868;892;898;896;Mask1;0.2653524,0.7495487,0.8396226,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;760;-5979.593,793.1293;Inherit;False;Distortion2;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;759;-5959.792,203.9506;Inherit;False;Distortion1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;912;-4890.334,2008.364;Inherit;False;760;Distortion2;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;911;-4888.135,1921.765;Inherit;False;759;Distortion1;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;910;-5319.612,1655.16;Inherit;False;Property;_Float28;副贴图旋转;19;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;909;-5287.752,1500.336;Inherit;False;0;918;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;908;-4997.979,1799.729;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;874;-5050.13,791.5604;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;875;-5067.108,1001.321;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;561;-5274.554,2735.294;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;693;-5670.663,2671.059;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;628;-5248.226,4392.666;Inherit;False;Constant;_Float13;Float 13;7;0;Create;True;0;0;0;False;0;False;-2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;576;-5313.53,2884.374;Inherit;False;Property;_Float9;软溶解;26;0;Create;False;0;0;0;False;0;False;0.5;0.515;0.5;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;595;-5232.226,4248.665;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;558;-5283.682,2619.28;Inherit;False;Constant;_Float3;Float 3;7;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;793;-2853.882,2951.125;Half;False;Property;_Mask1V1;遮罩V;48;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;794;-2854.113,2843.989;Half;False;Property;_Mask1U1;遮罩U;47;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;914;-4653.565,1944.423;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;916;-4714.691,2089.731;Inherit;False;Property;_Float29;副贴图扭曲强度;20;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;915;-4795.68,1633.806;Inherit;False;UV2;-1;;75;67e1d6e9cc356604b9c4aeadf01f46d7;0;3;13;FLOAT2;0,0;False;12;FLOAT;0;False;14;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;768;-4616.077,800.0698;Inherit;False;759;Distortion1;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;701;-5188.274,457.8819;Inherit;False;0;89;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;876;-4883.96,788.0313;Inherit;False;Property;_ToggleSwitch5;主贴图UV自定义;13;0;Create;False;0;0;0;False;0;False;1;True;Create;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;769;-4618.277,886.6688;Inherit;False;760;Distortion2;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;700;-5221.142,600.6036;Inherit;False;Property;_Float18;主贴图旋转;12;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;695;-5361.464,3682.974;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;629;-5040.226,4248.665;Inherit;False;Constant;_Float14;Float 14;7;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;577;-4925.098,2870.885;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;627;-5040.226,4344.666;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;557;-5017.339,2590.655;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;861;-2651.414,2867.348;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;809;-2723.414,3015.544;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;863;-2670.361,2780.405;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;917;-4432.095,1914.696;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;893;-4638.72,557.0633;Inherit;False;UV2;-1;;76;67e1d6e9cc356604b9c4aeadf01f46d7;0;3;13;FLOAT2;0,0;False;12;FLOAT;0;False;14;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;770;-4441.625,968.0355;Inherit;False;Property;_Float20;主贴图扭曲强度;14;0;Create;False;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;767;-4381.508,822.7277;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;630;-4803.729,4260.781;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;563;-4819.242,2585.917;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;645;-4730.311,2811.932;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;644;-4940.278,2800.812;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;862;-2422.723,2814.168;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;868;-2433.963,3026.798;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;924;-3894.883,1617.762;Inherit;False;466;301.4021;去饱和度;3;927;926;925;去饱和度;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;766;-4193.317,840.4006;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;918;-4225.164,1682.113;Inherit;True;Property;_MainTex1;副贴图;15;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;564;-4578.253,2703.018;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;642;-4717.399,3472.928;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;643;-4954.895,3719.129;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;631;-4632.999,4267.995;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;717;209.3493,2250.998;Inherit;False;1031.434;231.4038;;4;728;725;722;720;Depth;0.4053043,0.4369667,0.8679245,1;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;867;-2246.511,2843.631;Inherit;False;Property;_ToggleSwitch3;遮罩UV自定义;50;0;Create;False;0;0;0;False;0;False;0;True;Create;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;796;-2673.31,2530.846;Inherit;False;0;804;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;894;-2201.242,3083.83;Inherit;False;760;Distortion2;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;795;-2671.063,2669.308;Inherit;False;Property;_Mask1Rotation1;遮罩旋转;49;0;Create;False;0;0;0;False;0;False;0;90;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;895;-2199.042,2997.231;Inherit;False;759;Distortion1;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;718;198.6832,2656.133;Inherit;False;1422.961;459.0378;;9;731;730;729;727;726;724;723;721;719;Offset;0.8679245,0.7715256,0.2824849,1;0;0
Node;AmplifyShaderEditor.ComponentMaskNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;926;-3852.558,1679.624;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;89;-4052.653,510.837;Inherit;True;Property;_MainTex;主贴图;9;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;925;-3872.084,1799.948;Inherit;False;Property;_Main1Desaturate1;去饱和度;16;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;696;-4292.461,3115.506;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;626;-4414.457,4203.811;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;897;-2024.59,3165.197;Inherit;False;Property;_Float24;遮罩图扭曲强度;51;0;Create;False;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;896;-1968.473,2985.889;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;720;276.396,2309.375;Inherit;False;Property;_Depth;软边;1;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;892;-2108.948,2584.805;Inherit;False;UV2;-1;;77;67e1d6e9cc356604b9c4aeadf01f46d7;0;3;13;FLOAT2;0,0;False;12;FLOAT;0;False;14;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;721;256.802,2739.146;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;719;337.1301,2914.305;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;703;-3733.209,504.8215;Inherit;False;Main;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;927;-3596.883,1683.758;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;633;-4042.462,4188.042;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;722;490.2841,2300.999;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;898;-1785.282,2887.562;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TransformPositionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;724;562.799,2733.793;Inherit;False;World;Object;False;Fast;True;1;0;FLOAT3;0,0,0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TransformPositionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;723;558.1291,2909.305;Inherit;False;World;Object;False;Fast;True;1;0;FLOAT3;0,0,0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;647;-2938.167,-48.97146;Inherit;False;1217.005;464.6765;描边;6;634;604;609;602;603;773;描边;1,0.5518868,0.5956227,1;0;0
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;651;-3233.571,707.5878;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;612;-3263.252,524.8469;Inherit;False;Property;_Color2;主颜色;8;0;Create;False;0;0;0;False;0;False;1,1,1,1;0.06792016,0.08329837,0.305,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;705;-3225.108,897.2303;Inherit;False;703;Main;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;605;-3726.073,4201.823;Inherit;False;DissolveLine;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;919;-3362.617,1634.075;Inherit;False;Main1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;706;-3729.073,615.4294;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;804;-1642.614,2594.624;Inherit;True;Property;_MaskTex2;遮罩贴图;46;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;725;754.3481,2302.897;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;726;839.1302,2830.305;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;649;-2825.312,605.198;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;921;-3224.622,1014.461;Inherit;False;919;Main1;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;603;-2888.167,88.03578;Inherit;False;Property;_Color1;描边颜色;31;0;Create;False;0;0;0;False;0;False;1,1,1,1;0,0,0,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;609;-2869.409,268.8425;Inherit;False;605;DissolveLine;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;602;-2861.242,1.028556;Inherit;False;Property;_Float10;描边强度;33;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;728;1001.14,2339.663;Inherit;False;Depth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;707;-3219.017,1157.289;Inherit;False;706;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;806;-1204.281,2613.363;Inherit;False;Mask1;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;591;-4212.694,2630.376;Inherit;False;Dissolve;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;727;1011.293,2843.662;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;729;957.2933,2924.662;Float;False;Property;_Offset_Z;Offset_Z;0;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;709;-5322.63,-264.1891;Inherit;False;780.6375;517.3364;一般参数;3;712;711;710;一般参数;0.0518868,0.9175034,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;772;-2757.089,462.7007;Inherit;False;Property;_Float23;颜色强度;6;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;923;-2641.936,668.6;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;604;-2570.009,50.36698;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;811;-2581.058,1461.411;Inherit;False;806;Mask1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;733;-2595.28,1352.86;Inherit;False;728;Depth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;652;-2710.279,1005.218;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;608;-2602.896,1241.992;Inherit;False;591;Dissolve;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;730;1178.092,2907.662;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;712;-4920.993,-214.1891;Inherit;False;329;160;深度;1;715;深度;1,0.1933962,0.1933962,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;711;-5272.63,-211.3741;Inherit;False;329;160;双面;1;713;双面;1,0.1933962,0.1933962,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;710;-5269.549,-0.8517313;Inherit;False;334;251;混和模式;2;716;714;混和模式;1,0.1933962,0.1933962,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;771;-2479.728,537.7015;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;634;-2279.492,160.2286;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;547;-2227.715,1186.241;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;899;-2206.795,761.4202;Inherit;False;Property;_Float25;透明度;7;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;731;1397.608,2902.947;Inherit;False;Offset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;715;-4858.787,-162.2548;Inherit;False;Property;_ZwrtteMode2;深度;3;1;[Toggle];Fetch;False;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;714;-5230.549,50.14819;Inherit;False;Property;_AddOneBlendSrcAlpha;Add(One)Blend(Src Alpha);4;1;[Enum];Fetch;True;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;900;-1998.22,862.1926;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;716;-5229.549,137.1482;Inherit;False;Property;_AddOneBlendOneMinusSrcAlpha;Add(One)Blend(One Minus Src Alpha);5;1;[Enum];Fetch;True;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;713;-5210.425,-159.4399;Inherit;False;Property;_CullMode2;双面;2;1;[Enum];Fetch;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;773;-1993.369,231.4056;Inherit;False;Property;_ToggleSwitch1;描边;30;0;Create;False;0;0;0;False;0;False;0;True;Create;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;734;-1921.422,1299.048;Inherit;False;731;Offset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;928;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;6;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;False;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;929;-1439.166,554.564;Float;False;True;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;19;CY/1/Dissolve1;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;10;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;3;False;;True;True;0;False;;0;False;;False;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;30;Surface;1;639080949012154250;  Keep Alpha;0;0;  Blend;0;0;Two Sided;1;0;Alpha Clipping;0;639080977685089225;  Use Shadow Threshold;0;0;Forward Only;0;0;Cast Shadows;0;639080977728995330;Receive Shadows;2;0;Receive SSAO;1;639080978045704851;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;  XR Motion Vectors;0;0;GPU Instancing;0;639080977781074665;LOD CrossFade;1;639080977960543333;Built-in Fog;1;0;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position;1;0;0;13;False;True;False;True;False;False;True;True;True;False;True;False;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;930;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;931;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;932;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;933;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;False;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;934;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;935;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;936;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;937;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;False;True;1;LightMode=DepthNormalsOnly;False;True;11;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;switch2;webgpu;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;938;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;939;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;XRMotionVectors;0;11;XRMotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;1;False;;255;False;;1;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;1;LightMode=XRMotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;940;-1439.166,554.564;Float;False;False;-1;3;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;GBuffer;0;12;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;14;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;False;True;1;LightMode=UniversalGBuffer;False;True;12;d3d11;gles;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;switch2;webgpu;0;;0;0;Standard;0;False;0
WireConnection;880;0;676;0
WireConnection;880;1;677;0
WireConnection;883;0;814;2
WireConnection;883;1;814;3
WireConnection;882;0;879;0
WireConnection;882;1;880;0
WireConnection;686;0;688;0
WireConnection;686;1;687;0
WireConnection;884;0;882;0
WireConnection;884;1;883;0
WireConnection;682;0;684;0
WireConnection;891;13;672;0
WireConnection;891;12;675;0
WireConnection;891;14;884;0
WireConnection;765;0;762;0
WireConnection;765;1;763;0
WireConnection;680;1;686;0
WireConnection;785;13;745;0
WireConnection;785;14;738;0
WireConnection;785;15;737;0
WireConnection;786;13;748;0
WireConnection;786;14;740;0
WireConnection;786;15;739;0
WireConnection;761;0;891;0
WireConnection;761;1;765;0
WireConnection;761;2;764;0
WireConnection;683;0;680;0
WireConnection;683;1;681;0
WireConnection;683;2;682;0
WireConnection;753;1;785;0
WireConnection;751;1;786;0
WireConnection;685;0;683;0
WireConnection;534;1;761;0
WireConnection;756;0;751;0
WireConnection;756;1;752;0
WireConnection;755;0;753;0
WireConnection;755;1;754;0
WireConnection;691;0;692;0
WireConnection;691;1;685;0
WireConnection;697;0;534;1
WireConnection;757;0;755;0
WireConnection;758;0;756;0
WireConnection;904;0;903;0
WireConnection;904;1;902;0
WireConnection;871;0;698;0
WireConnection;871;1;699;0
WireConnection;597;0;598;0
WireConnection;597;1;596;0
WireConnection;813;0;562;0
WireConnection;813;1;812;1
WireConnection;663;0;697;0
WireConnection;663;1;691;0
WireConnection;760;0;757;0
WireConnection;759;0;758;0
WireConnection;908;0;905;0
WireConnection;908;1;904;0
WireConnection;874;0;872;0
WireConnection;874;1;871;0
WireConnection;875;0;873;1
WireConnection;875;1;873;2
WireConnection;561;0;560;0
WireConnection;561;1;813;0
WireConnection;693;0;663;0
WireConnection;595;0;813;0
WireConnection;595;1;597;0
WireConnection;914;0;911;0
WireConnection;914;1;912;0
WireConnection;915;13;909;0
WireConnection;915;12;910;0
WireConnection;915;14;908;0
WireConnection;876;0;874;0
WireConnection;876;1;875;0
WireConnection;695;0;663;0
WireConnection;577;0;576;0
WireConnection;627;0;595;0
WireConnection;627;1;628;0
WireConnection;557;0;693;0
WireConnection;557;1;558;0
WireConnection;557;2;561;0
WireConnection;861;0;794;0
WireConnection;861;1;793;0
WireConnection;917;0;915;0
WireConnection;917;1;914;0
WireConnection;917;2;916;0
WireConnection;893;13;701;0
WireConnection;893;12;700;0
WireConnection;893;14;876;0
WireConnection;767;0;768;0
WireConnection;767;1;769;0
WireConnection;630;0;695;0
WireConnection;630;1;629;0
WireConnection;630;2;627;0
WireConnection;563;0;557;0
WireConnection;645;0;577;0
WireConnection;644;0;576;0
WireConnection;862;0;863;0
WireConnection;862;1;861;0
WireConnection;868;0;809;3
WireConnection;868;1;809;4
WireConnection;766;0;893;0
WireConnection;766;1;767;0
WireConnection;766;2;770;0
WireConnection;918;1;917;0
WireConnection;564;0;563;0
WireConnection;564;1;645;0
WireConnection;564;2;644;0
WireConnection;642;0;577;0
WireConnection;643;0;576;0
WireConnection;631;0;630;0
WireConnection;867;0;862;0
WireConnection;867;1;868;0
WireConnection;926;0;918;0
WireConnection;89;1;766;0
WireConnection;696;0;564;0
WireConnection;626;0;631;0
WireConnection;626;1;642;0
WireConnection;626;2;643;0
WireConnection;896;0;895;0
WireConnection;896;1;894;0
WireConnection;892;13;796;0
WireConnection;892;12;795;0
WireConnection;892;14;867;0
WireConnection;703;0;89;0
WireConnection;927;0;926;0
WireConnection;927;1;925;0
WireConnection;633;0;696;0
WireConnection;633;1;626;0
WireConnection;722;0;720;0
WireConnection;898;0;892;0
WireConnection;898;1;896;0
WireConnection;898;2;897;0
WireConnection;724;0;721;0
WireConnection;723;0;719;0
WireConnection;605;0;633;0
WireConnection;919;0;927;0
WireConnection;706;0;89;4
WireConnection;804;1;898;0
WireConnection;725;0;722;0
WireConnection;726;0;724;0
WireConnection;726;1;723;0
WireConnection;649;0;612;0
WireConnection;649;1;651;0
WireConnection;649;2;705;0
WireConnection;728;0;725;0
WireConnection;806;0;804;1
WireConnection;591;0;564;0
WireConnection;727;0;726;0
WireConnection;923;0;649;0
WireConnection;923;1;921;0
WireConnection;604;0;602;0
WireConnection;604;1;603;0
WireConnection;604;2;609;0
WireConnection;652;0;612;4
WireConnection;652;1;651;4
WireConnection;652;2;707;0
WireConnection;730;0;727;0
WireConnection;730;1;729;0
WireConnection;771;0;772;0
WireConnection;771;1;923;0
WireConnection;634;0;771;0
WireConnection;634;1;604;0
WireConnection;634;2;609;0
WireConnection;547;0;652;0
WireConnection;547;1;608;0
WireConnection;547;2;733;0
WireConnection;547;3;811;0
WireConnection;731;0;730;0
WireConnection;900;0;899;0
WireConnection;900;1;547;0
WireConnection;773;0;771;0
WireConnection;773;1;634;0
WireConnection;929;2;773;0
WireConnection;929;3;900;0
WireConnection;929;5;734;0
ASEEND*/
//CHKSM=6759A8D01ADADA817BE59ED8F58A52ABD23B412E