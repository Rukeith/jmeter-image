# Intro
This is made for build a docker image to wrapper jmeter.  
Because another jmeter image need to use `docker exec` or `docker run`. But I need to build jmeter into image.  
So I made this image to wrapper jmeter enviornment.  

# Usage
    FROM rukeith/jmeter
    COPY jmeter.jmx ./
    CMD apache-jmeter-3.3/bin/jmeter -n -t jmeter.jmx -Jjmeter.save.saveservice.output_format=xml -Jjmeter.save.saveservice.response_data=true -Jjmeter.save.saveservice.samplerData=true -Jjmeter.save.saveservice.requestHeaders=true -Jjmeter.save.saveservice.url=true -Jjmeter.save.saveservice.responseHeaders=true -l result.jtl
