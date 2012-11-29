uniform sampler2D textureSample_0;
uniform sampler2D textureSample_1;
uniform float currentTime; // this wasnt here before

void main() {
    
    vec4 lightMap = texture2D(textureSample_1, gl_TexCoord[0].st);
    vec4 texel = texture2D(textureSample_0, gl_TexCoord[0].st);
    gl_FragColor = vec4(
        min(lightMap.x*0.5*(sin(6*currentTime)+1) + texel.x*gl_Color.r, 1.0), 
        texel.yz * gl_Color.gb, texel.a); // gl_Color has light intensity

}
