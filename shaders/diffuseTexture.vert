//A brutally simple vertex shader that just mimics exactly what OpenGL's default
//fixed pipeline does

void main() {                

    vec3 normal, lightDir;
    normal = normalize(gl_NormalMatrix * gl_Normal);
    lightDir = normalize(vec3(gl_LightSource[0].position));

    vec4 diffuse = gl_LightSource[0].diffuse*max(dot(normal, lightDir), 0.0);
    vec4 ambient = gl_LightSource[0].ambient;

    gl_FrontColor = diffuse + ambient;

    gl_TexCoord[0] = gl_MultiTexCoord0;
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;

}
