#version 460

uniform sampler2D gtexture;
uniform sampler2D lightmap;

/* DRAWBUFFERS:0 */ 
layout(location = 0) out vec4 outColor0;

in vec2 texCoord;
in vec3 foliageColor;
in vec2 lightMapCoords;

void main(){

// with gamma correction
  float gamma = 2.2;
  vec3 lightColor= pow(texture(lightmap,lightMapCoords).rgb,vec3 (gamma));
  vec4 outputColorData = pow(texture(gtexture, texCoord),vec4 (gamma));
  vec3 outputColor= outputColorData.rgb*pow(foliageColor,vec3 (gamma))*lightColor;
  float transparency = outputColorData.a;
  // discard the transpart pixels
  if(transparency < 0.1){
    discard;
  }
  outColor0 = pow(vec4(outputColor,transparency),vec4 (1/gamma));
}