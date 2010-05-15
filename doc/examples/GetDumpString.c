#include <stdlib.h>
#include <stdio.h>
#include <IPhreeqc.h>

#define TRUE  1

const char input[] =
	"SOLUTION 1 Pure water     \n"
	"EQUILIBRIUM_PHASES 1      \n"
	"    Calcite 0 10          \n"
	"SAVE solution 1           \n"
	"SAVE equilibrium_phases 1 \n"
	"DUMP                      \n"
	"    -solution 1           \n"
	"    -equilibrium_phases  1\n";

int main(void)
{
  int id;

  id = CreateIPhreeqc();
  if (id < 0) {
    return EXIT_FAILURE;
  }

  if (LoadDatabase(id, "phreeqc.dat") != 0) {
    OutputError(id);
    return EXIT_FAILURE;
  }

  if (SetDumpStringOn(id, TRUE) != IPQ_OK) {
    OutputError(id);
    return EXIT_FAILURE;
  }

  if (RunString(id, input) != 0) {
    OutputError(id);
    return EXIT_FAILURE;
  }

  printf("Dump:\n");
  printf("%s\n", GetDumpString(id));

  if (DestroyIPhreeqc(id) != IPQ_OK) {
    OutputError(id);
    return EXIT_FAILURE;
  }

  return EXIT_SUCCESS;
}
