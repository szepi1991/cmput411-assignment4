//CMPUT 411 Assignment
//Author (TA): Nathaniel Rossol

#ifndef QUESTION1_H
#define QUESTION1_H

#include <stdlib.h>
#include <stdio.h>
#include <GL/glew.h>
#include <iostream>
#include <string>
#include <cmath>
#ifdef __APPLE__
#  include <GLUT/glut.h>
#else
#  include <GL/glut.h>
#endif

// ***************** This is the only file you should modify for question 1 ********************

void load_shaders();
char* convertFileToCString(char *fn);

void load_shaders()
{
	//WRITE ALL OF YOUR QUESTION 1 CODE IN HERE! (it should be approximately 20 lines of code)

	unsigned int shader_vp = glCreateShader(GL_VERTEX_SHADER);
	unsigned int shader_fp = glCreateShader(GL_FRAGMENT_SHADER);

	char* vsText = convertFileToCString("shaders/toon.vert");
	char* fsText = convertFileToCString("shaders/toon.frag");

	const char* vsC = vsText;
	const char* fsC = fsText;
	glShaderSource(shader_vp, 1, &vsC, 0);
	glShaderSource(shader_fp, 1, &fsC, 0);

	free(vsText);
	free(fsText);

	glCompileShader(shader_vp);
	glCompileShader(shader_fp);

	unsigned int shader_id = glCreateProgram();
	glAttachShader(shader_id, shader_fp);
	glAttachShader(shader_id, shader_vp);
	glLinkProgram(shader_id);

	glUseProgram(shader_id);

	//NO MORE CODE PAST THIS POINT!
}

//You can use this little utility function to load the shader code from a text file into a cstring
//Note: do not modify this function
char* convertFileToCString(char *fn) 
{
	FILE *fp;
	char *content = NULL;

	int count=0;

	if (fn != NULL) {
		fp = fopen(fn,"rt");
		//errno_t result = fopen_s(&fp, fn,"rt");

		//if( result == 0 && fp != NULL) {
		if (fp != NULL) {

			fseek(fp, 0, SEEK_END);
			count = ftell(fp);
			rewind(fp);

			if (count > 0) {
				content = (char *)malloc(sizeof(char) * (count+1));
				count = fread(content,sizeof(char),count,fp);
				content[count] = '\0';
			}
			fclose(fp);
		}
	}
	return content;
}

#endif
