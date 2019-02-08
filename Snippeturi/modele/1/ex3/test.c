#include <stdio.h>

void direct(const char *s, unsigned int perturb);
size_t obvious(unsigned int a, unsigned int b);
void crypto(const unsigned char *in, unsigned char *out, size_t len,
	const unsigned char *key, size_t klen);

int main(void)
{
	unsigned char in[24];
	unsigned char out[24];
	unsigned char k[16] = "sibling1";
	unsigned char dec[23] = "no country for old men";

	for (int i = 0; i < 23; ++i) {
		in[i] = dec[i] ^ k[i % 8];
	}

	out[23] = 0;
	in[23] = 0;

	direct("bad", 679);
	printf("%d\n", obvious(179, 681));
	crypto(in, out, 22, k, 8);
	printf("%s\n", out);

	return 0;
}
