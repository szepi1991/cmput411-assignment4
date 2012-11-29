uniform sampler2D textureSample_0;
uniform sampler2D textureSample_1;

void main() {

    vec4 sand = texture2D(textureSample_0,gl_TexCoord[0].st*10.0);
    vec4 grass = texture2D(textureSample_1,gl_TexCoord[0].st*15.0);
    float alpha = texture2D(textureSample_1,gl_TexCoord[0].st).a;
    vec4 texture = vec4(sand.rgb*(1.0-alpha) + grass.rgb*alpha, 1.0);

    gl_FragColor = vec4(texture.xyz * gl_Color.rgb, texture.a);

//    gl_FragColor = texture2D(textureSample_0,gl_TexCoord[0].st);
    
}
