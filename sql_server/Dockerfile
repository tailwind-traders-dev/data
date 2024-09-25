FROM mcr.microsoft.com/mssql/server
RUN mkdir /scripts
COPY tailwind_ss.sql /scripts
ENV ACCEPT_EULA=Y SA_PASSWORD=P@ssword!
EXPOSE 1433