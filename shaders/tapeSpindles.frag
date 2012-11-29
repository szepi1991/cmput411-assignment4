uniform sampler2D textureSample_0;
uniform float currentTime;

void main() {
    
//    gl_FragColor = texture2D(textureSample_0,gl_TexCoord[0].st);
    vec4 texel = texture2D(textureSample_0, gl_TexCoord[0].st);
    gl_FragColor = vec4(texel.xyz * gl_Color.rgb, texel.a); // gl_Color has light intensity

}
