uniform sampler2D textureSample_0;

void main() {

    vec4 texel = texture2D(textureSample_0, gl_TexCoord[0].st);
    gl_FragColor = vec4(texel.xyz * gl_Color.rgb, texel.a); // gl_Color has light intensity
}
