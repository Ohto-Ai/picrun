CXX = g++
CXXFLAGS = -O3 -std=c++17 -lpthread -DOHTOAI_LOCAL_TEST

picrun:main.o
	@echo build $@
	@$(CXX) $^ $(CXXFLAGS) -o $@

run:picrun
	./picrun

main.o:main.cpp ImageProxy.hpp ohtoai_base.hpp
	@echo build $@
	@$(CXX) -c $< $(CXXFLAGS) -o $@

inc/CImg.h:
	@wget https://raw.githubusercontent.com/dtschump/CImg/master/CImg.h -O $@

clean:
	@rm -vf *.o picrun
