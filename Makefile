CXX = g++-7
CXXFLAGS = -Iinc -O3 -std=c++17 -lpthread -DOHTOAI_LOCAL_TEST

picrun:main.o
	@echo build $@
	@$(CXX) $^ $(CXXFLAGS) -o $@

run:picrun
	./picrun

main.o:main.cpp ImageProxy.hpp ohtoai_base.hpp inc
	@echo build $@
	@$(CXX) -c $< $(CXXFLAGS) -o $@

inc: inc/CImg.h inc/json.hpp

inc/CImg.h:
	@wget https://raw.githubusercontent.com/dtschump/CImg/master/CImg.h -O $@

inc/json.hpp:
	@wget https://raw.githubusercontent.com/nlohmann/json/develop/single_include/nlohmann/json.hpp -O $@

clean:
	@rm -vf *.o picrun
