import express from "express";
import cors from "cors";

const app = express();
const port = 3001;

app.use(express.json())
app.use(cors())

app.use('/lodeforces', )
app.use('/lodeforces', )

app.listen(port, () => {
    console.log(`${port} runnning`)
})