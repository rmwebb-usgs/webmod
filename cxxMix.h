#if !defined(CXXMIX_H_INCLUDED)
#define CXXMIX_H_INCLUDED

#include "NumKeyword.h"
//#define EXTERNAL extern
//#include "global.h"
#include <cassert> // assert
#include <map>     // std::map
#include <string>  // std::string
#include <list>    // std::list
#include <vector>  // std::vector

#include "char_star.h"

class cxxMix : public cxxNumKeyword
{

public:
        cxxMix();
        cxxMix(struct mix *);
        ~cxxMix();

        struct mix *cxxMix2mix();

        //void dump_xml(std::ostream& os, unsigned int indent = 0)const;

        void dump_raw(std::ostream& s_oss, unsigned int indent)const;

        void read_raw(CParser& parser);

        void add(int n, double f) {
		mixComps[n] = f;
	};

	std::map<int, double> *comps()          {return &mixComps;}

protected:
	friend class cxxStorageBin;
	std::map<int, double> mixComps;

public:
        //static std::map<int, cxxMix>& map;

};

#endif // !defined(CXXMIX_H_INCLUDED)
