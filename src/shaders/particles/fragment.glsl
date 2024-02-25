uniform vec3 uBaseColor;


void main() {
    // Points UV form
    float strenght = 1. - distance(gl_PointCoord, vec2(0.5)) * 2.;

  

    gl_FragColor = vec4(vec3(strenght), 1.0);
}