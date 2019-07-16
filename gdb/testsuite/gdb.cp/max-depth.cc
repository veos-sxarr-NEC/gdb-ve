#include <stdio.h>

struct s1 {
  int x;
  int y;
} s1;

struct s2 {
  int x;
  int y;
  struct {
    int z;
    int a;
  };
} s2;

struct s3 {
  int x;
  int y;
  struct {
    int z;
    int a;
    struct {
      int b;
      int c;
    };
  };
} s3;

struct s4 {
  int x;
  int y;
  struct {
    int x;
    int y;
    struct {
      int x;
      int y;
    } l2;
  } l1;
} s4;

struct s5 {
  union {
    int raw[3];
     struct {
      int x;
      int y;
      int z;
    };
  };
} s5;

typedef struct {
  union {
    int raw[3];
     struct {
      int x;
      int y;
      int z;
    };
  };
} s6_t;

s6_t s6;

struct s7 {
  struct {
    int x;
    int y;
  };
  struct {
    int z;
    int a;
  };
  struct {
    int b;
    int c;
  };
} s7;

struct s8 {
  int x;
  int y;
  struct {
    int z;
    int a;
    struct {
      int b;
      int c;
    };
  } d1;
} s8;

struct s9 {
  int x;
  int y;
  struct {
    int k;
    int j;
    struct {
      int z;
      int a;
      struct {
        int b;
        int c;
      };
    } d1;
  };
  struct {
    int z;
    int a;
    struct {
      int b;
      int c;
    };
  } d2;
} s9;

struct s10 {
  int x[10];
  int y;
  struct {
    int k[10];
    int j;
    struct {
      int z;
      int a;
      struct {
        int b[10];
        int c;
      };
    } d1;
  };
  struct {
    int z;
    int a;
    struct {
      int b[10];
      int c;
    };
  } d2;
} s10;

struct s11 {
  int x;
  char s[10];
  struct {
    int z;
    int a;
  };
} s11;

int
main (int argc, char *argv[])
{
  return 0;
}
