#include <iostream>
#include <cstdlib>
using namespace std;

struct nodo{
  int row;
  int col;
};

void muestrasolucion(nodo *vsol,int *mov){
  for(int i=31;i>0;i--)
    cout << vsol[i].row << " " << vsol[i].col << "mov:" << mov[i]<< endl;
  exit(0);
}
void backtracking(int M[7][7],nodo *vsol,int &numB, int *mov) {
  if(numB==1)
    muestrasolucion(vsol,mov);
  for(int i=0;i<7;i++)
    for(int j=0;j<7;j++)
      if(M[i][j]==1) {
	if((i+2)<7 && (j+2)<7 && M[i+1][j+1]==1 && !M[i+2][j+2]) {//factible esq der abaj 1
	  M[i][j]=0;
	  M[i+1][j+1]=0;
	  M[i+2][j+2]=1;
	  vsol[numB-1].row=i;
	  vsol[numB-1].col=j;
	  mov[numB-1]=1;
	  numB--;
	  backtracking(M,vsol,numB,mov);
	  M[i][j]=1;
	  M[i+1][j+1]=1;
	  M[i+2][j+2]=0;
	  vsol[numB-1].row=-1;
	  vsol[numB-1].col=-1;
	  numB++;
	}
	if((j+2)<7 && M[i][j+1]==1 && !M[i][j+2]) {//factible der 2
	  M[i][j]=0;
	  M[i][j+1]=0;
	  M[i][j+2]=1;
	  vsol[numB-1].row=i;
	  vsol[numB-1].col=j;
	  mov[numB-1]=2;
	  numB--;
	  backtracking(M,vsol,numB,mov);
	  M[i][j]=1;
	  M[i][j+1]=1;
	  M[i][j+2]=0;
	  vsol[numB-1].row=-1;
	  vsol[numB-1].col=-1;
	  numB++;
	}
	if((i-2)>0 && (j-2)>0 && M[i-1][j-1]==1 && !M[i-2][j-2]) {//factible esq izq arrib 3
	  M[i][j]=0;
	  M[i-1][j-1]=0;
	  M[i-2][j-2]=1;
	  vsol[numB-1].row=i;
	  vsol[numB-1].col=j;
	  mov[numB-1]=3;
	  numB--;
	  backtracking(M,vsol,numB,mov);
	  M[i][j]=1;
	  M[i-1][j-1]=1;
	  M[i-2][j-2]=0;
	  vsol[numB-1].row=-1;
	  vsol[numB-1].col=-1;
	  numB++;
	}
	if((i-2)>0 && M[i-1][j]==1 && !M[i-2][j]) {//factible arrib 4
	  M[i][j]=0;
	  M[i-1][j]=0;
	  M[i-2][j]=1;
	  vsol[numB-1].row=i;
	  vsol[numB-1].col=j;
	  mov[numB-1]=4;
	  numB--;
	  backtracking(M,vsol,numB,mov);
	  M[i][j]=1;
	  M[i-1][j]=1;
	  M[i-2][j]=0;
	  vsol[numB-1].row=-1;
	  vsol[numB-1].col=-1;
	  numB++;
	}
	if((i-2)>0 && (j+2)<7 && M[i-1][j+1]==1 && !M[i-2][j+2]) {//factible esq der arrib 5
	  M[i][j]=0;
	  M[i-1][j+1]=0;
	  M[i-2][j+2]=1;
	  vsol[numB-1].row=i;
	  vsol[numB-1].col=j;
	  mov[numB-1]=5;
	  numB--;
	  backtracking(M,vsol,numB,mov);
	  M[i][j]=1;
	  M[i-1][j+1]=1;
	  M[i-2][j+2]=0;
	  vsol[numB-1].row=-1;
	  vsol[numB-1].col=-1;
	  numB++;
	}
	if((i+2)<7 && M[i+1][j]==1 && !M[i+2][j]) {//factible abajo 6
	  M[i][j]=0;
	  M[i+1][j]=0;
	  M[i+2][j]=1;
	  vsol[numB-1].row=i;
	  vsol[numB-1].col=j;
	  mov[numB-1]=6;
	  numB--;
	  backtracking(M,vsol,numB,mov);
	  M[i][j]=1;
	  M[i+1][j]=1;
	  M[i+2][j]=0;
	  vsol[numB-1].row=-1;
	  vsol[numB-1].col=-1;
	  numB++;
	}
	if((j-2)>0 && M[i][j-1]==1 && !M[i][j-2]) {//factible izq 7
	  M[i][j]=0;
	  M[i][j-1]=0;
	  M[i][j-2]=1;
	  vsol[numB-1].row=i;
	  vsol[numB-1].col=j;
	   mov[numB-1]=7;
	  numB--;
	  backtracking(M,vsol,numB,mov);
	  M[i][j]=1;
	  M[i][j-1]=1;
	  M[i][j-2]=0;
	  vsol[numB-1].row=-1;
	  vsol[numB-1].col=-1;
	  numB++;
	}
	if((i+2)<7 && (j-2)>0 && M[i+1][j-1]==1 && !M[i+2][j-2]) {//factible esq izq abaj 8
	  M[i][j]=0;
	  M[i+1][j-1]=0;
	  M[i+2][j-2]=1;
	  vsol[numB-1].row=i;
	  vsol[numB-1].col=j;
	  mov[numB-1]=8;
	  numB--;
	  backtracking(M,vsol,numB,mov);
	  M[i][j]=1;
	  M[i+1][j-1]=1;
	  M[i+2][j-2]=0;
	  vsol[numB-1].row=-1;
	  vsol[numB-1].col=-1;
	  numB++;
	}
      }
  return;
}

int main() {
  int M[7][7],numB=0;//1-hay bola 0-hueco -1-fuera tablero

  M[0][0]=M[0][1]=M[1][0]=M[1][1]=M[0][5]=M[0][6]=M[1][5]=M[1][6]=M[5][0]=M[5][1]=M[6][0]=M[6][1]=M[5][5]=M[5][6]=M[6][5]=M[6][6]=-1;
  for(int i=0;i<7;i++)
    for(int j=0;j<7;j++)
    if(M[i][j]!=-1)
      M[i][j]=1;
  M[3][3]=0;
  numB=32;
  cout << "Nº de bolas:" << numB << endl;
  nodo vsol[numB];
  int mov[32];
  for(int i=0;i<numB;i++)
    vsol[i].col=vsol[i].row=-1;
  backtracking(M,vsol,numB,mov);
  return 0;
}
