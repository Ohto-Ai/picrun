CXX = g++-7
CXXFLAGS = -Iinc -O3 -std=c++17 -lpthread -DOHTOAI_LOCAL_TEST
RAW_GITHUBUSERCONTENT = https://raw.staticdn.net
# raw.githubusercontent.com

picrun:main.o
	@echo build $@
	@$(CXX) $^ $(CXXFLAGS) -o $@

run:picrun
	./picrun

main.o:main.cpp ImageProxy.hpp ohtoai_base.hpp inc
	@echo build $@
	@$(CXX) -c $< $(CXXFLAGS) -o $@

inc: inc/CImg.h inc/json.hpp inc/httplib.h

inc/CImg.h:
	@wget $(RAW_GITHUBUSERCONTENT)/dtschump/CImg/master/CImg.h -O $@

inc/json.hpp:
	@wget $(RAW_GITHUBUSERCONTENT)/nlohmann/json/develop/single_include/nlohmann/json.hpp -O $@

inc/httplib.h:
	@wget $(RAW_GITHUBUSERCONTENT)/yhirose/cpp-httplib/master/httplib.h -O $@

clean:
	@rm -vf *.o picrun
