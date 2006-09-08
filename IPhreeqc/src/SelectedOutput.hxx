// SelectedOutput.h: interface for the CSelectedOutput class.
//
//////////////////////////////////////////////////////////////////////

#if !defined _INC_SELECTEDOUTPUT_H
#define _INC_SELECTEDOUTPUT_H

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <string>
#include <map>
#include <list>
#include <vector>
#include "CVar.hxx"

// TODO: templatize
class CSelectedOutput
{
protected:
	CSelectedOutput(void);
public:
	static CSelectedOutput* Instance();
	static void Release();

	virtual ~CSelectedOutput(void);


	int EndRow(void);
	void Clear(void);

	size_t GetRowCount(void)const;
	size_t GetColCount(void)const;

	CVar Get(int nRow, int nCol)const;
	VRESULT Get(int nRow, int nCol, VAR* pVAR)const;

	int PushBack(const char* key, const CVar& var);

	int PushBackDouble(const char* key, double dVal);
	int PushBackLong(const char* key, long lVal);
	int PushBackString(const char* key, const char* sVal);
	int PushBackEmpty(const char* key);

#if defined(_DEBUG)
	void Dump(const char* heading);
	void AssertValid(void)const;
#endif

protected:
	friend std::ostream& operator<< (std::ostream &os, const CSelectedOutput &a);

	size_t m_nRowCount;

	std::vector< std::vector<CVar> > m_arrayVar;
	std::vector<CVar> m_vecVarHeadings;
	std::map< std::string, size_t > m_mapHeadingToCol;

private:
	static CSelectedOutput* s_instance;
};

#endif // !defined(_INC_SELECTEDOUTPUT_H)
