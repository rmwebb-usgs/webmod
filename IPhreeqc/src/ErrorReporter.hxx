#if !defined(__ERROR_REPORTER_HXX_INC)
#define __ERROR_REPORTER_HXX_INC


#include <iosfwd>          // std::ostream
#include <cstdio>          // std::fprintf
#include "phreeqcns.hxx"

class IErrorReporter {
public:
	virtual size_t AddError(const char* error_msg) = 0;
	virtual void Clear(void) = 0;
};

template <typename OS>
class CErrorReporter : public IErrorReporter
{
public:
	CErrorReporter(void);
	virtual ~CErrorReporter(void);

	virtual size_t AddError(const char *error_msg);
	virtual void Clear(void);
	OS* GetOS(void) { return m_pOS; }
protected:
	OS* m_pOS;
	size_t m_error_count;
};

template<typename OS>
CErrorReporter<OS>::CErrorReporter(void)
: m_pOS(0)
, m_error_count(0)
{
	this->m_pOS = new OS;
}

template<typename OS>
CErrorReporter<OS>::~CErrorReporter(void)
{
	delete this->m_pOS;
}

template<typename OS>
size_t CErrorReporter<OS>::AddError(const char* error_msg)
{
	++this->m_error_count;
	(*this->m_pOS) << error_msg;
	if (phreeqc::error_file != NULL) {
		if (phreeqc::status_on == TRUE) {
			::fprintf(phreeqc::error_file,"\n");
#ifndef DOS
			phreeqc::status_on = FALSE;
#endif
		}
		::fprintf(phreeqc::error_file, "ERROR: %s\n", error_msg);
		::fflush(phreeqc::error_file);
	}
	if (phreeqc::output != NULL) {
		::fprintf(phreeqc::output, "ERROR: %s\n", error_msg);
		::fflush(phreeqc::output);
	}
	return this->m_error_count;
}

template<typename OS>
void CErrorReporter<OS>::Clear(void)
{
	this->m_error_count = 0;
	delete this->m_pOS;
	this->m_pOS = new OS;
}

#endif // __ERROR_REPORTER_HXX_INC
