// StorageBin.cxx: implementation of the cxxStorageBin class.
//
//////////////////////////////////////////////////////////////////////
#ifdef _DEBUG
#pragma warning(disable : 4786)   // disable truncation warning (Only used by debugger)
#endif

#include "Utils.h"   // define first
#include "StorageBin.h"
#include "Solution.h"
#define EXTERNAL extern
#include "global.h"
#include "phqalloc.h"
#include "phrqproto.h"
#include "output.h"
#include <cassert>     // assert
#include <algorithm>   // std::sort 

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
cxxStorageBin::cxxStorageBin()
{
        // default constructor for cxxStorageBin 
}

cxxStorageBin::~cxxStorageBin()
{
}

void cxxStorageBin::import_phreeqc(void)
        //
	// pull data out of c storage
        //
{
	int i;

	// Solutions
	for (i = 0; i < count_solution; i++) {
		Solutions[solution[i]->n_user] = cxxSolution(solution[i]);
	}

	// Exchangers
	for (i = 0; i < count_exchange; i++) {
		Exchangers[exchange[i].n_user] = cxxExchange(&exchange[i]);
	}

	// GasPhases
	for (i = 0; i < count_gas_phase; i++) {
		GasPhases[gas_phase[i].n_user] = cxxGasPhase(&gas_phase[i]);
	}

	// Kinetics
	for (i = 0; i < count_kinetics; i++) {
		Kinetics[kinetics[i].n_user] = cxxKinetics(&kinetics[i]);
	}

	// PPassemblages
	for (i = 0; i < count_pp_assemblage; i++) {
		PPassemblages[pp_assemblage[i].n_user] = cxxPPassemblage(&pp_assemblage[i]);
	}

	// SSassemblages
	for (i = 0; i < count_s_s_assemblage; i++) {
		SSassemblages[s_s_assemblage[i].n_user] = cxxSSassemblage(&s_s_assemblage[i]);
	}

	// Surfaces
	for (i = 0; i < count_surface; i++) {
		Surfaces[surface[i].n_user] = cxxSurface(&surface[i]);
	}

	// Mixes
	for (i = 0; i < count_mix; i++) {
		Mixes[mix[i].n_user] = cxxMix(&mix[i]);
	}

	// Reactions
	for (i = 0; i < count_irrev; i++) {
		Reactions[irrev[i].n_user] = cxxReaction(&irrev[i]);
	}

	// Temperatures
	for (i = 0; i < count_temperature; i++) {
		Temperatures[temperature[i].n_user] = cxxTemperature(&temperature[i]);
	}
}


#ifdef SKIP
void cxxStorageBin::dump_xml(std::ostream& s_oss, unsigned int indent)const
{
        //const char    ERR_MESSAGE[] = "Packing mix message: %s, element not found\n";
        unsigned int i;
        s_oss.precision(DBL_DIG - 1);
        std::string indent0(""), indent1(""), indent2("");
        for(i = 0; i < indent; ++i) indent0.append(Utilities::INDENT);
        for(i = 0; i < indent + 1; ++i) indent1.append(Utilities::INDENT);
        for(i = 0; i < indent + 2; ++i) indent2.append(Utilities::INDENT);

        // StorageBin element and attributes
        s_oss << indent0;
        s_oss << "<mix " << std::endl;

        s_oss << indent1;
        s_oss << "pitzer_mix_gammas=\"" << this->pitzer_mix_gammas << "\"" << std::endl;

        // components
        s_oss << indent1;
        s_oss << "<component " << std::endl;
        for (std::list<cxxStorageBinComp>::const_iterator it = mixComps.begin(); it != mixComps.end(); ++it) {
                it->dump_xml(s_oss, indent + 2);
        }

        return;
}
#endif

void cxxStorageBin::dump_raw(std::ostream& s_oss, unsigned int indent)const
{
        //const char    ERR_MESSAGE[] = "Packing mix message: %s, element not found\n";
        s_oss.precision(DBL_DIG - 1);

	// Solutions
	Utilities::dump_raw(Solutions, s_oss, indent);

	// Exchange
	Utilities::dump_raw(Exchangers, s_oss, indent);

	// Gas Phases
	Utilities::dump_raw(GasPhases, s_oss, indent);

	// Kinetics
	Utilities::dump_raw(Kinetics, s_oss, indent);

	// PPassemblage
	Utilities::dump_raw(PPassemblages, s_oss, indent);

	// SSassemblage
	Utilities::dump_raw(SSassemblages, s_oss, indent);

	// Surface
	Utilities::dump_raw(Surfaces, s_oss, indent);
}

void cxxStorageBin::read_raw(CParser& parser)
{
	CParser::LINE_TYPE i;
	while ((i = parser.check_line("StorageBin read_raw", false, true, true, true)) != CParser::LT_KEYWORD)
	{
		if (i == CParser::LT_EOF) return; // CParser::LT_EOF;
	}

	for (;;) {
		switch(parser.next_keyword())
		{
		case CParser::KT_END: 
		case CParser::KT_EOF:
		case CParser::KT_NONE:
			goto END_OF_SIMULATION_INPUT;
			break;
		/*
		  KT_SOLUTION_RAW     =  5,
		  KT_EXCHANGE_RAW     =  6,
		  KT_GASPHASE_RAW     =  7,
		  KT_KINETICS_RAW     =  8,
		  KT_PPASSEMBLAGE_RAW =  9,
		  KT_SSASSEMBLAGE_RAW =  10,
		  KT_SURFACE_RAW      =  11
		*/
		case CParser::KT_SOLUTION_RAW:
			{
				cxxSolution entity;
				entity.read_raw(parser);
				Solutions[entity.get_n_user()] = entity;
			}
			break;

		case CParser::KT_EXCHANGE_RAW:
			{
				cxxExchange entity;
				entity.read_raw(parser);
				Exchangers[entity.get_n_user()] = entity;
			}
			break;

		case CParser::KT_GASPHASE_RAW:
			{
				cxxGasPhase entity;
				entity.read_raw(parser);
				GasPhases[entity.get_n_user()] = entity;
			}
			break;

		case CParser::KT_KINETICS_RAW:
			{
				cxxKinetics entity;
				entity.read_raw(parser);
				Kinetics[entity.get_n_user()] = entity;
			}
			break;

		case CParser::KT_PPASSEMBLAGE_RAW:
			{
				cxxPPassemblage entity;
				entity.read_raw(parser);
				PPassemblages[entity.get_n_user()] = entity;
			}
			break;

		case CParser::KT_SSASSEMBLAGE_RAW:
			{
				cxxSSassemblage entity;
				entity.read_raw(parser);
				SSassemblages[entity.get_n_user()] = entity;
			}
			break;

		case CParser::KT_SURFACE_RAW:
			{
				cxxSurface entity;
				entity.read_raw(parser);
				Surfaces[entity.get_n_user()] = entity;
			}
			break;

		default:
			break;
		}
	}

END_OF_SIMULATION_INPUT:
	return; //CParser::LT_OK;
}

void cxxStorageBin::add(struct system * system_ptr)
        //
        // add data from a system structure
        //
{

	// Solutions
	if (system_ptr->solution != NULL) {
		this->Solutions[system_ptr->solution->n_user] = cxxSolution(system_ptr->solution);
	}

	// Exchangers
	if (system_ptr->exchange != NULL) {
		this->Exchangers[system_ptr->exchange->n_user] = cxxExchange(system_ptr->exchange);
	}

	// GasPhases
	if (system_ptr->gas_phase != NULL) {
		this->GasPhases[system_ptr->gas_phase->n_user] = cxxGasPhase(system_ptr->gas_phase);
	}

	// Kinetics
	if (system_ptr->kinetics != NULL) {
		this->Kinetics[system_ptr->kinetics->n_user] = cxxKinetics(system_ptr->kinetics);
	}

	// PPassemblages
	if (system_ptr->pp_assemblage != NULL) {
		this->PPassemblages[system_ptr->pp_assemblage->n_user] = cxxPPassemblage(system_ptr->pp_assemblage);
	}

	// SSassemblages
	if (system_ptr->s_s_assemblage != NULL) {
		this->SSassemblages[system_ptr->s_s_assemblage->n_user] = cxxSSassemblage(system_ptr->s_s_assemblage);
	}

	// Surfaces
	if (system_ptr->surface != NULL) {
		this->Surfaces[system_ptr->surface->n_user] = cxxSurface(system_ptr->surface);
	}
}

void cxxStorageBin::cxxStorageBin2phreeqc(int n)
        //
        // copy data fromphreeqc storage to storage bin
        //
{

	// Solutions
	{
		
		std::map <int, cxxSolution>::iterator it = this->Solutions.find(n);
		if (it != this->Solutions.end()){
			solution[0] = (it->second).cxxSolution2solution();
			solution[0]->n_user = n;
			solution[0]->n_user_end = n;
			count_solution++;
		} else {
			error_msg("cxxSolution not found in system2phreeqc", STOP);
		}
	}

	// Exchangers
	{
		std::map <int, cxxExchange>::iterator it = this->Exchangers.find(n);
		if ( it != this->Exchangers.end()) {
			struct exchange *exchange_ptr = (it->second).cxxExchange2exchange();
			exchange_copy(exchange_ptr, &exchange[0], n);
			count_exchange++;
		} 
	}

	// GasPhases
	{
		std::map <int, cxxGasPhase>::iterator it = this->GasPhases.find(n);
		if ( it != this->GasPhases.end()) {
			struct gas_phase *gas_phase_ptr = (it->second).cxxGasPhase2gas_phase();
			gas_phase_copy(gas_phase_ptr, &gas_phase[0], n);
			count_gas_phase++;
		} 
	}

	// Kinetics
	{
		std::map <int, cxxKinetics>::iterator it = this->Kinetics.find(n);
		if ( it != this->Kinetics.end()) {
			struct kinetics *kinetics_ptr = (it->second).cxxKinetics2kinetics();
			kinetics_copy(kinetics_ptr, &kinetics[0], n);
			count_kinetics++;
		} 
	}

	// PPassemblages
	{
		std::map <int, cxxPPassemblage>::iterator it = this->PPassemblages.find(n);
		if ( it != this->PPassemblages.end()) {
			struct pp_assemblage *pp_assemblage_ptr = (it->second).cxxPPassemblage2pp_assemblage();
			pp_assemblage_copy(pp_assemblage_ptr, &pp_assemblage[0], n);
			count_pp_assemblage++;
		} 
	}

	// SSassemblages
	{
		std::map <int, cxxSSassemblage>::iterator it = this->SSassemblages.find(n);
		if ( it != this->SSassemblages.end()) {
			struct s_s_assemblage *s_s_assemblage_ptr = (it->second).cxxSSassemblage2s_s_assemblage();
			s_s_assemblage_copy(s_s_assemblage_ptr, &s_s_assemblage[0], n);
			count_s_s_assemblage++;
		} 
	}

	// Surfaces
	{
		std::map <int, cxxSurface>::iterator it = this->Surfaces.find(n);
		if ( it != this->Surfaces.end()) {
			struct surface *surface_ptr = (it->second).cxxSurface2surface();
			surface_copy(surface_ptr, &surface[0], n);
			count_surface++;
		} 
	}

}
void cxxStorageBin::phreeqc2cxxStorageBin(int n)
        //
        // copy data fromphreeqc storage to storage bin
        //
{
	int pos;

	// Solutions
	{
		solution_bsearch(n, &pos, TRUE);
		this->Solutions[n] = cxxSolution(solution[pos]);
	}

	// Exchangers
	{
		exchange_bsearch(n, &pos);
		this->Exchangers[n] = cxxExchange(&(exchange[pos]));
	}

	// GasPhases
	{
		gas_phase_bsearch(n, &pos);
		this->GasPhases[n] = cxxGasPhase(&(gas_phase[pos]));
	}

	// Kinetics
	{
		kinetics_bsearch(n, &pos);
		this->Kinetics[n] = cxxKinetics(&(kinetics[pos]));
	}

	// PPassemblages
	{
		pp_assemblage_bsearch(n, &pos);
		this->PPassemblages[n] = cxxPPassemblage(&(pp_assemblage[pos]));
	}

	// SSassemblages
	{
		s_s_assemblage_bsearch(n, &pos);
		this->SSassemblages[n] = cxxSSassemblage(&(s_s_assemblage[pos]));
	}

	// Surfaces
	{
		surface_bsearch(n, &pos);
		this->Surfaces[n] = cxxSurface(&(surface[pos]));
	}

}
