uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform float uColorOffset;
uniform float uColorMultiplier;
uniform float uTime;

varying float vElevation;

void main() {
    float mixStrenght = vElevation * uColorMultiplier + uColorOffset;

    vec3 newSurfaceColor = uSurfaceColor;

    newSurfaceColor.b += (sin(uTime / 30.0) - 0.5) * 2.0;
    newSurfaceColor.r += (sin(uTime / 20.0) - 0.5) * 1.5;

    vec3 newDepthColor = uDepthColor;
    newDepthColor.b -= (sin(uTime / 30.0) - 0.5) * 2.0;
    newDepthColor.r += abs((sin(uTime / 20.0) + 0.5) * 1.5);
  

    vec3 color = mix(newDepthColor, newSurfaceColor, mixStrenght );

    gl_FragColor = vec4(color, 1.0);
}