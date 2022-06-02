#include "ClassName.hpp"

ClassName::ClassName(void)
{
}

ClassName::ClassName(const ClassName &to_copy)
{
	*this = to_copy;
}

ClassName::~ClassName(void)
{
}

ClassName& ClassName::operator= (const ClassName &assign_to)
{
	if (this == &assign_to)
		return *this;
	return *this;
}
