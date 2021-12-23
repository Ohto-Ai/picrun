CXX = g++-9

INCLUDE += lib3rd/boost/
INCLUDE += lib3rd/cpp-httplib/
INCLUDE += lib3rd/nlohmann/
INCLUDE += lib3rd/CImg/

export CPLUS_INCLUDE_PATH=$(INCLUDE):$CPLUS_INCLUDE_PATH

CXXFLAGS = -O3 -std=c++17 -lpthread -DOHTOAI_LOCAL_TEST

objects = main.o

picrun:$(objects)
	@echo build $@
	$(CXX) $^ $(CXXFLAGS) -o $@

run:picrun
	./picrun

main.o:main.cpp ImageProxy.hpp ohtoai_base.hpp
	@echo build $@
	$(CXX) -c $< $(INCLUDE) $(CXXFLAGS) -o $@

clean:
	@rm -vf *.o picrun
