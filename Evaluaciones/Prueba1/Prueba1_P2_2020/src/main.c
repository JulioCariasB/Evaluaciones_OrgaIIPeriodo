#define BLACK 0
#define BLUE 1
#define GREEN 2
#define CYAN 3
#define RED 4
#define MAGENTA 5
#define BROWN 6
#define WHITE 7
#define GRAY 8
#define L_BLUE 9
#define L_GREEN 10
#define L_CYAN 11
#define L_RED 12
#define L_MAGENTA 13
#define YELLOW 14
#define B_WHITE 15

void do_delay()
{
    for (volatile int i = 0; i < 10000; i++) {}    
}

int main() 
{

    volatile unsigned short * inicio;
    volatile unsigned short * final;


    for(int i = 0; i<= 29; i++)
    {
        inicio = 0xb800;
        final = 0xcabf;
        inicio += i * 80 + i;
        if(inicio>final)
        {
            break;
        }

        *inicio = ((BLUE<<4)|B_WHITE)<<8|'0';

        do_delay();

        *inicio = ((BLUE<<4)|BLUE)<<8|'0';

        
    }

    return 0;
}
