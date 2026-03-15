import { Router } from "express";
import { userSchema } from "../../types";
import { prisma } from "@repo/db/index";

const userRouter = Router();

userRouter.post('/signin', async(req , res) => {
    try {
        const user = userSchema.safeParse(req.body);
        if(user.error) {
            res.status(401).json(
                {
                    message: user.error.cause
                }
            )
            return;
        }
        const siginin = await prisma.user.upsert({
            create: {
                email: user.data.email,
            }
        })
        
    } catch (error) {
        
    }
})