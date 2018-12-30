#include <math.h>
#include <stdio.h>
#include <stdlib.h>

// funkcijų deklaracijos
float polinomo_skaiciavimas(float x);
int didziausia_reiksme(float X[]);
void rikiuoti_dvimatį(float arr[][2], int size);
float * didziausias_yx(float arr[][2], int size);
float * rastiXrėžįAplinkMaxY(float arr[][2], int maxpoz);

// globalių kintamųjų deklaracijos
int masyvo_inkdesas = 0;
int did_reiksm = 0;
float xy_reiksmes[81][2];

int main(void)
{
	// 1.
	for (float i = -4; i < 4; i += 0.1)
	{
		xy_reiksmes[masyvo_inkdesas][0] = i;
		xy_reiksmes[masyvo_inkdesas][1] = polinomo_skaiciavimas(i);
		printf("x = %6.4f\ty = %6.4f\n", xy_reiksmes[masyvo_inkdesas][0], xy_reiksmes[masyvo_inkdesas][1]);
		masyvo_inkdesas++;
	}
	printf("\n");

	// 2. 
	float * did_xym = didziausias_yx(xy_reiksmes, 81);
	float did_x = *did_xym; did_xym = did_xym + 1;
	float did_y = *did_xym; did_xym = did_xym + 1;
	float did_poz = *did_xym;
	printf("Did X: %6.4f, prie Y: %6.4f\n\n", did_x, did_y);

	// 3. - neįmanoma naudojant visual studio sukonstruoti dinamiškai dvimačio masyvo
	// kurio dydis yra specifikuojamas kintamuoju - arba turime nenaudoti visual studio
	// arba turime ranka nustatyti mąsyvo dydį ir vėliau priskirti reikšmes jam. Toliau
	// pateiktas sprendimas tik kai spausdiname reikšmes, nededame į masyva.
	int * režioXPradžiosIrPabaigosIndexai = rastiXrėžįAplinkMaxY(xy_reiksmes, did_poz);
	int leftXidx = *režioXPradžiosIrPabaigosIndexai; režioXPradžiosIrPabaigosIndexai++;
	int rightXidx = *režioXPradžiosIrPabaigosIndexai;

	for (int i = leftXidx; i < rightXidx; i++)
		printf("x = %6.4f\ty = %6.4f\n", xy_reiksmes[i][0], xy_reiksmes[i][1]);
	printf("\n");

	// 4.
	int size = sizeof(xy_reiksmes) / sizeof(xy_reiksmes[0]);
	rikiuoti_dvimatį(xy_reiksmes, size);
	for (int i = 0; i < size; i++)
		printf("x:%6.4f\ty:%6.4f\n", xy_reiksmes[i][0], xy_reiksmes[i][1]);

	system("pause");
	return 0;

}

float polinomo_skaiciavimas(float x)
{
	float y;
	y = -(pow(x, 4)) + (3 * (pow(x, 3))) + (2 * (pow(x, 2))) - (5 * x) + 0.5;
	return y;
}

int didziausia_reiksme(float X[])
{
	int k = 0;	// didziausios reiksmes indeksas
	int kp = 1;	// antras indeksas

	for (kp = 1; kp < 81; kp++)
	{
		if (X[k] < X[kp])
			k = kp;
	}
	return k;
}

float * didziausias_yx(float arr[][2], int size)
{
	static float xym[3];
	float max_x = arr[0][0];
	float max_y = arr[0][1];
	float max_pozicija_masyve = 0;

	for (int i = 1; i < size; i++)
	{
		if (max_y < arr[i][1])
		{
			max_x = arr[i][0];
			max_y = arr[i][1];
			max_pozicija_masyve = i;
		}
	}
	xym[0] = max_x;
	xym[1] = max_y;
	xym[2] = max_pozicija_masyve;
	return xym;
}

int preservesSign(int value, int sign);

int * rastiXrėžįAplinkMaxY(float arr[][2], int maxpoz)
{
	// determine if Y max is a possitive of a negative max
	// 0 - false, 1 - true
	int possitive = 0;
	if (arr[maxpoz][1] >= 0)
		possitive = 1;

	// iterate over the X values, while Y does not change signs
	// at the point Y changes signs we know we determined the 
	// leftmost and the rightmost intervals
	int leftPos = maxpoz;
	while (preservesSign(arr[leftPos][1], possitive)) {
		//printf("Inspecting: %f, should be %d\n", arr[currentPoz][1], possitive);
		leftPos--;
	}

	int righttPos = maxpoz;
	while (preservesSign(arr[righttPos][1], possitive)) {
		//printf("Inspecting: %f, should be %d\n", arr[currentPoz][1], possitive);
		righttPos++;
	}

	int rėžisXYaplinkYmax[2] = { leftPos , righttPos };
	return rėžisXYaplinkYmax;
}

int preservesSign(int value, int sign)
{
	// if sign == 1 - then value should be possitive;
	// .. sign == 0 - then value should be negative
	return (sign == 1) ? ((value > 0) ? 1 : 0) : ((value < 0) ? 1 : 0);
}

// bubble sort
void rikiuoti_dvimatį(float arr[][2], int size)
{
	int i, j;
	for (i = 0; i < size - 1; i++)
	{
		for (j = 0; j < size - i - 1; j++)
		{
			if (arr[j][1] > arr[j + 1][1])
			{
				// swap
				float tempX = arr[j][0];
				float tempY = arr[j][1];

				arr[j][0] = arr[j + 1][0];
				arr[j][1] = arr[j + 1][1];

				arr[j + 1][0] = tempX;
				arr[j + 1][1] = tempY;
			}
		}
	}
}
