#version 460

in vec3 vaPosition;

in vec2 vaUV0;

uniform mat4 ModelViewMatrix;
uniform mat4 ProjectionMatrix;

out vec2 texCoord;

void main(){
  texCoord = vaUV0;

  gl_Position = ModelViewMatrix * ProjectionMatrix * vec4(vaPosition, 1);
}