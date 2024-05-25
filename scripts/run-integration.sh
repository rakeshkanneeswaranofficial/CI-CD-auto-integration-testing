docker-compose up -d
echo '🟡 - Waiting for database to be ready...'
sleep 3
./scripts/wait-for-it.sh "postgresql://postgres:mysecretpassword@localhost:5432/postgres" -- echo '🟢 - Database is ready!'
cd db
npx prisma migrate dev --name init
cd ..
npm run test
docker-compose down