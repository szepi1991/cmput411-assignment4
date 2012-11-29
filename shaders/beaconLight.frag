//This pixel shader basically says: "I don't care about anything else,
//just paint this pixel (aka "fragment") white no matter what!"
uniform float currentTime;

void main() {   
    gl_FragColor = vec4(0.5*(sin(6.0*currentTime)+1.0),0.0,0.0,1.0);
}
