FROM ollama/ollama:latest

# Start the Ollama server in the background, wait for it to initialize, 
# pull the models, and then close the server so Docker can save the image.
RUN nohup bash -c "ollama serve &" && sleep 5 && \
    ollama pull llama3.1:8b && \
    ollama pull deepseek-ocr:3b && \
    pkill ollama

# Expose the port your Next.js app will call
EXPOSE 11434