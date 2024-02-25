uniform float uSize;
uniform float uTime;

attribute float aRandomDirection;
attribute float aScale;


// Classic Perlin 3D Noise 
// by Stefan Gustavson
//


void main() {

    vec3 updatedPosition = vec3(sin(position.x + uTime * 0.001) * 100., cos(position.y + uTime * 0.001) * 50., sin(position.z + uTime * 0.001) * 100.);
    updatedPosition.x -= sin(aRandomDirection * uTime * 0.05) * 100.0;
    updatedPosition.y += cos(aRandomDirection * uTime * 0.5) * 20.0;
    vec4 modelPosition = modelMatrix * vec4(updatedPosition, 1.0);
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;


    gl_Position = projectedPosition;

     

    // Points size
    gl_PointSize = uSize * aScale;

    // Points size attentuation
    gl_PointSize *= (1.0 / - viewPosition.z);

}